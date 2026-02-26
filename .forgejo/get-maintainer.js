// @ts-check
/** @param {{ forgejo: import('forgejo-js').Api<unknown>, core: any  }} params */
module.exports = async ({ core }) => {
    const PACKAGE = `${process.env.PACKAGE}`;

    const result = await fetch(`https://altlinux.space/aides-community/centralized-ci/raw/branch/main/pkgs/${PACKAGE}/meta.json`)
    const pkg = await result.json()

    const maintainer = pkg?.maintainer

    core.setOutput('maintainer', maintainer);
}
