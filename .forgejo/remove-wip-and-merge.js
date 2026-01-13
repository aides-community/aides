// @ts-check
/** @param {{ forgejo: import('forgejo-js').Api<unknown>, exec: import('@actions/exec') }} params */
module.exports = async ({ forgejo, exec }) => {
    const [owner, repo] = `${process.env.GITHUB_REPOSITORY}`.split('/');
    const number = Number(process.env.NUMBER)

    /**
     * @param {string} str
     * @param {string} prefix
     */
    const trimPrefix = (str, prefix) => {
        if (str.startsWith(prefix)) {
            return str.slice(prefix.length)
        } else {
            return str
        }
    }

    const title = `${process.env.TITLE}`;
    const newTitle = trimPrefix(title, 'WIP:').trimStart();

    await forgejo.repos.repoEditPullRequest(
        owner,
        repo,
        number,
        {
            title: newTitle,
        },
        {
            // @ts-ignore
            type: "application/json",
        }
    )

    await forgejo.repos.repoMergePullRequest(
        owner,
        repo,
        number,
        {
            Do: 'squash',
        },
        {
            // @ts-ignore
            type: "application/json",
        }
    )
}
