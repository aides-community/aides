// @ts-check
/** @param {{ forgejo: import('forgejo-js').Api<unknown>, exec: import('@actions/exec') }} params */
module.exports = async ({ forgejo, exec }) => {
    const owner = "aides-pkgs";
    const title = "Checksum verification failed";
    const glob = require('glob');
    const path = require('path');

    /**
     * @param {string} pkg
     */
    async function reportFailed(pkg) {
        const issues = await forgejo.repos.issueListIssues(owner, pkg, { state: "open" });
        const existing = issues.data.find(i => i.title === title);
        const body = `Timestamp: ${new Date().toISOString()}`.trim();
        if (existing) {
            const index = Number(existing.number)
            console.log(`Updating existing issue #${index}`);
            await forgejo.repos.issueEditIssue(owner, pkg, index, {
                body: body,
            })
        } else {
            console.log("Creating new FAILED issue");
            await forgejo.repos.issueCreateIssue(owner, pkg, {
                title: title,
                body: body,
            })
        }
    }

    /**
     * @param {string} pkg
     */
    async function reportSuccess(pkg) {
        const issues = await forgejo.repos.issueListIssues(
            owner,
            pkg,
            {
                state: "open",
            }
        );

        const existing = issues.data.find(i => i.title === title);
        if (!existing) return;
        const index = Number(existing.number)

        console.log(`Closing issue #${index}`);

        await forgejo.repos.issueEditIssue(
            owner,
            pkg,
            index,
            {
                state: "closed",
            }
        );

        await forgejo.repos.issueCreateComment(
            owner,
            pkg,
            index,
            {
                body: `Issue resolved. Package now passes checksum verification.`,
            }
        );
    }

    const staplerfiles = glob.sync('**/Staplerfile', { nodir: true });

    for (const file of staplerfiles) {
        const pkgDir = path.dirname(file);
        const pkg = path.basename(pkgDir);
        console.log(`Checking ${pkg}...`);

        try {
            await exec.exec(`stplr-spec verify-checksums --path "${file}"`);
            reportSuccess(pkg);
        } catch {
            reportFailed(pkg);
        } finally {
            await exec.exec(`rm -rf $HOME/.stapler-spec`)
        }
    }
}
