class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.6.201"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.201/twapp-macos-aarch64.tar.gz"
    sha256 "63a2568a9b3d6f21cca861b7b90958355e3b82c01ac6ab0cf21f7a15cf8ff936"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.201/twapp-macos-x86_64.tar.gz"
    sha256 "8112d2078215087b6b335b766fd5c8fbcaf1753f590200f5d0fba9c87ec04101"
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
        twapp install-gui #{prefix}/twapp.app

      twapp requires at least one supported agent CLI:
        Claude CLI: https://docs.anthropic.com/en/docs/claude-cli
        Codex CLI: https://github.com/openai/codex
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/twapp --version")
  end
end
