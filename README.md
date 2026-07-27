# homebrew-walnut tap

Source of truth for the Homebrew formula lives here until it is pushed to [franckverrot/homebrew-walnut](https://github.com/franckverrot/homebrew-walnut).

## Maintainer workflow

1. Bump the toolchain in walnutlang and run the packager:

   ```sh
   ./scripts/package-homebrew.sh
   # WALNUT_VERSION=0.2.1 ./scripts/package-homebrew.sh
   ```

2. Create a GitHub Release on `franckverrot/walnutlang` and attach `.tmp/walnut-<version>-darwin-arm64.tar.gz`.

3. Copy the printed `version`, `url`, and `sha256` into `Formula/walnut.rb`.

4. Push the formula to the tap:

   ```sh
   git clone git@github.com:franckverrot/homebrew-walnut.git
   cp packaging/homebrew-walnut/Formula/walnut.rb ../homebrew-walnut/Formula/
   cd ../homebrew-walnut
   git add Formula/walnut.rb
   git commit -m "walnut 0.2.0"
   git push
   ```

5. Users install with:

   ```sh
   brew tap franckverrot/walnut
   brew install walnut
   ```

## What ships

| Path | Contents |
| --- | --- |
| `bin/walnut` | Wrapper setting `WALNUT_HOME` |
| `libexec/walnut/walnut` | Release CLI (optimized, stripped) |
| `libexec/walnut/Walnut_WalnutCore.bundle` | Stdlib + platform natives |
| `share/walnut/runtime/` | WalnutRT, WalnutUIKit, Templates |
| `share/doc/walnut/` | Public guides + generated API HTML |

Compiler sources (`WalnutCore`, `CLLVM`) are **not** included.

## Dependencies

- **llvm** — host codegen + ORC JIT (`libLLVM.dylib` via rpath)
- **xcodegen** — iOS project generation for `walnut new` / `build`
- **Xcode** — iOS SDK, simulator, and signing (caveat only; not a formula dep)

Apple Silicon (arm64) only for v1.
