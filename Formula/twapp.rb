class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.6.202"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.202/twapp-macos-aarch64.tar.gz"
    sha256 "b2f8856f33b7b6da1774980ff2afdb92c4e1c6179eb4e7839bb08ae7f59fe94c"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.202/twapp-macos-x86_64.tar.gz"
    sha256 "3b78e921465c4f14e0bfd5c739b38b6bfe400964042a583973d4c752a3944e85"
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
