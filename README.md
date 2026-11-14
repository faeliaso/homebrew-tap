# Homebrew Tap for faeliaso

Homebrew formulas maintained by [@faeliaso](https://github.com/faeliaso).
Formulas distributed by this tap:
- `fs80hctl`: technical control CLI for Futronic FS80/FS80H fingerprint scanners.
- `hu20ctl`: operational CLI and capture daemon for SecuGen Hamster Pro 20 (HU20) fingerprint scanners.

## Install

Add the tap once:

```bash
brew tap faeliaso/tap
```

Install the CLIs:

```bash
brew install fs80hctl
brew install hu20ctl
```

Upgrade after a new release:

```bash
brew update
brew upgrade fs80hctl hu20ctl
```

Each formula installs Homebrew's `libusb` dependency before installing the CLI.

## Run the capture servers

`fs80hctl` and `hu20ctl` are installed as command-line tools. Start their capture
servers manually when needed:

```bash
fs80hctl serve
hu20ctl daemon
```

This tap intentionally does not register a `brew services` or `launchd`
service. Stop the server with `Ctrl-C` in the terminal that started it.

## Release assets

Each GitHub Release of [`faeliaso/fs80hctl`](https://github.com/faeliaso/fs80hctl)
or [`faeliaso/hu20ctl`](https://github.com/faeliaso/hu20ctl)
must publish one tarball for each supported macOS architecture:

```text
<tool>-v<VERSION>-aarch64-apple-darwin.tar.gz
<tool>-v<VERSION>-x86_64-apple-darwin.tar.gz
```

Each archive must contain `<tool>` at its root. It may also contain
`man/<tool>.1`; when present, the formula installs it as a manpage.

When updating a formula, replace its version and both checksum placeholders
with the values from the published assets:

```bash
shasum -a 256 <tool>-v<VERSION>-aarch64-apple-darwin.tar.gz
shasum -a 256 <tool>-v<VERSION>-x86_64-apple-darwin.tar.gz
```

## Add a formula

Create a Ruby formula at `Formula/<name>.rb`. Keep architecture-specific
release URLs and SHA-256 values in the formula, then validate the tap locally:

```bash
brew test-bot --only-tap-syntax
```

## Publish this repository

For a new local clone, initialize and publish the repository with GitHub CLI:

```bash
git init -b main
git add Formula .github README.md
git commit -m "feat: add fs80hctl Homebrew formula"
gh repo create faeliaso/homebrew-tap --public --source=. --remote=origin --push
```

If the GitHub repository already exists, configure its remote and push instead:

```bash
git remote add origin git@github.com:faeliaso/homebrew-tap.git
git push -u origin main
```
