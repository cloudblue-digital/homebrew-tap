# Homebrew Tap for Ark

Official Homebrew tap for [Ark](https://ark.cloudbluedigital.co.uk/), the native local development environment.

## Install

```sh
brew install --cask cloudblue-digital/tap/ark
```

- **Apple silicon only**: Ark is built for Apple-silicon Macs (macOS 11 Big Sur or newer).
- **Updates**: Ark updates itself automatically from within the app, and `brew upgrade` is safe beside it.
- **Removal**: Run `sudo ark uninstall` first to clean up local DNS and certificates, then `brew uninstall --cask ark`.

## Maintenance

The cask in `Casks/ark.rb` is rewritten by Ark's release pipeline automatically on each release, not by hand.
