// @ts-check
/** @param {{ forgejo: import('forgejo-js').Api<unknown>, core: any  }} params */
module.exports = async ({ core }) => {
    const PACKAGE = `${process.env.PACKAGE}`;

    const result = await fetch("https://altlinux.space/aides-community/centralized-ci/raw/branch/main/pkgs.json")
    const pkgs = await result.json()

    const maintainer = pkgs[PACKAGE]?.maintainer

    core.setOutput('maintainer', maintainer);
}
