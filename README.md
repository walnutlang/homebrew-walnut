# Walnut

```sh
brew install walnutlang/tap/walnut
```

Requires macOS on Apple Silicon, Xcode, and an iOS Simulator runtime. Homebrew installs `llvm` and `xcodegen` as dependencies.

Homebrew 6+ may ask you to trust the formula once:

```sh
brew trust --formula walnutlang/tap/walnut
```

```sh
walnut version
```

Docs land under `$(brew --prefix)/share/doc/walnut/`.

Walnut is proprietary software. Use `walnut license` for Community or Commercial seats.

## Migrating from older taps

```sh
brew untap franckverrot/walnut 2>/dev/null || true
brew untap walnutlang/walnut 2>/dev/null || true
brew install walnutlang/tap/walnut
```
