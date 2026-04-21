class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.88"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.88/twapp-macos-aarch64.tar.gz"
    sha256 "943ec6d8c799d49130f4c991f21770aaef65aaf368ed2a028c3b84f9d17d49a0"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.88/twapp-macos-x86_64.tar.gz"
    sha256 "6058155a5deb37e9f40bd7db1d5353ede333ad5337e10a7da0a3d736f36c7e71"
  end

  # Homebrew strips single top-level directories from tarballs,
  # so the extracted contents are the inside of twapp.app (Contents/).
  # Reconstruct the app bundle at prefix/twapp.app.
  def install
    (prefix/"twapp.app").install Dir["*"]
    bin.install_symlink prefix/"twapp.app/Contents/MacOS/twapp"
  end

  def caveats
    <<~EOS
      twapp has been installed as a macOS app bundle.

      To avoid repeated macOS permission prompts, create a local code signing certificate:
        twapp setup-cert
        twapp install-gui \#{prefix}/twapp.app

      twapp requires at least one supported agent CLI:
        Claude CLI: https://docs.anthropic.com/en/docs/claude-cli
        Codex CLI: https://github.com/openai/codex
    EOS
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/twapp --version")
  end
end
