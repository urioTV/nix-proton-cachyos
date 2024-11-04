# Contributing to Nix Proton CachyOS

First off, thanks for taking the time to contribute! 👍

This is a community project packaging CachyOS's Proton build for NixOS. Any help is appreciated, whether it's:

- Reporting bugs
- Improving documentation
- Submitting fixes
- Testing with different games
- Suggesting improvements

## Getting Started

1. Fork the repository
2. Create a feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Development

The package is relatively simple, consisting of:
- `default.nix`: The main package definition
- `flake.nix`: The flake interface
- `versions.json`: Version information that's automatically updated

### Testing Changes

Before submitting a PR, please:

1. Build the package:
```bash
nix build
```

2. Test it with Steam:
```bash
# Add to your NixOS config and rebuild
sudo nixos-rebuild switch
```

3. Verify it appears in Steam's compatibility tools list

## Automated Updates

The package has an automated workflow that:
- Checks for new versions every 6 hours
- Creates a PR when updates are available
- Runs basic tests on the package

## Questions?

Feel free to open an issue for any questions or suggestions!
