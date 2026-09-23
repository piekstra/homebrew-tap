class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.6.138"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.138/twapp-macos-aarch64.tar.gz"
    sha256 "05824dd8a306738a882c43ef31f3ea141ca7b70879d55e734ca2f7d7dd1bcabd"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.138/twapp-macos-x86_64.tar.gz"
    sha256 "a36ce67854ec650d79476ed92f70979625ffc6d1c11c9a6c1001c10ac46daf3d"
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
