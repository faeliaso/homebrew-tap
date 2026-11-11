# Homebrew Tap for faeliaso

Homebrew formulas maintained by [@faeliaso](https://github.com/faeliaso).
The first formula distributed by this tap is `fs80hctl`, the technical control
CLI for Futronic FS80/FS80H fingerprint scanners.

## Install fs80hctl

Add the tap once:

```bash
brew tap faeliaso/tap
```

Install the CLI:

```bash
brew install fs80hctl
```

Upgrade it after a new release:

```bash
brew update
brew upgrade fs80hctl
```

The formula installs Homebrew's `libusb` dependency before installing
`fs80hctl`.

## Run the capture server

`fs80hctl` is installed as a command-line tool. Start its long-running capture
server manually when you need it:

```bash
fs80hctl serve
```

This tap intentionally does not register a `brew services` or `launchd`
service. Stop the server with `Ctrl-C` in the terminal that started it.

## Release assets

Each GitHub Release of [`faeliaso/fs80hctl`](https://github.com/faeliaso/fs80hctl)
must publish one tarball for each supported macOS architecture:

```text
fs80hctl-v<VERSION>-aarch64-apple-darwin.tar.gz
fs80hctl-v<VERSION>-x86_64-apple-darwin.tar.gz
```

Each archive must contain `fs80hctl` at its root. It may also contain
`man/fs80hctl.1`; when present, the formula installs it as a manpage.

When updating the formula, replace its version and both checksum placeholders
with the values from the published assets:

```bash
shasum -a 256 fs80hctl-v<VERSION>-aarch64-apple-darwin.tar.gz
shasum -a 256 fs80hctl-v<VERSION>-x86_64-apple-darwin.tar.gz
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
