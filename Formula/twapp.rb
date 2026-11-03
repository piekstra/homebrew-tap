class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.6.204"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.204/twapp-macos-aarch64.tar.gz"
    sha256 "0124cd36051c06cde9d8a03492f176cf5b0eef7b23e4f85cb592a365a88286fb"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.204/twapp-macos-x86_64.tar.gz"
    sha256 "181200f34f9ff2057f609741d3456b6ac518828a0f5e066ca1c6d4aeb5ed7d99"
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
