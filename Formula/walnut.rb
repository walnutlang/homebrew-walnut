class Walnut < Formula
  desc "TEA language for iOS — typecheck, compile, and ship native apps"
  homepage "https://github.com/franckverrot/walnut"
  version "0.2.0"
  url "https://github.com/franckverrot/homebrew-walnut/releases/download/v0.2.0/walnut-0.2.0-darwin-arm64.tar.gz"
  sha256 "0f08365adbbfab38127fc3e1a2d3cd7a7ebbb0d502f1f82ce7434cda882e1ad1"
  license :cannot_represent

  depends_on :macos
  depends_on :xcode
  depends_on "llvm"
  depends_on "xcodegen"

  def install
    prefix.install "libexec"
    prefix.install "share"
    bin.install "bin/walnut"
  end

  def caveats
    <<~EOS
      Walnut is proprietary software. Community and Commercial licenses are managed
      with `walnut license` — see $(brew --prefix)/share/doc/walnut/licensing.md.

      Docs: $(brew --prefix)/share/doc/walnut/
      API site: $(brew --prefix)/share/doc/walnut/api/index.html

      App builds need Xcode, an iOS Simulator runtime, and xcodegen (installed as a dependency).
      Host commands (check, test, format, lsp, run, repl) need Homebrew llvm (also a dependency).
    EOS
  end

  test do
    ENV["WALNUT_HOME"] = "#{prefix}/share/walnut/runtime"
    assert_match "walnut 0.2.0", shell_output("#{bin}/walnut version")
    assert_predicate prefix/"libexec/walnut/Walnut_WalnutCore.bundle", :directory?
    assert_predicate prefix/"share/walnut/runtime/Package.swift", :file?
    assert_predicate prefix/"share/doc/walnut/getting-started.md", :file?
    assert_predicate prefix/"share/doc/walnut/api/index.html", :file?
  end
end
