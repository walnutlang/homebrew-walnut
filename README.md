# Walnut

```sh
brew install walnutlang/walnut/walnut
```

Homebrew 6+ requires trusting third-party formulae. Fully-qualified install does that for you. For short-name installs:

```sh
brew trust --formula walnutlang/walnut/walnut
brew install walnut
```

Requires macOS on Apple Silicon, Xcode, and an iOS Simulator runtime. Homebrew installs `llvm` and `xcodegen` as dependencies.

```sh
walnut version
```

Docs land under `$(brew --prefix)/share/doc/walnut/`.

Walnut is proprietary software. Use `walnut license` for Community or Commercial seats.

## Migrating from the old tap

```sh
brew untap franckverrot/walnut 2>/dev/null || true
brew trust --formula walnutlang/walnut/walnut
brew install walnutlang/walnut/walnut
```
