class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.6.166"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.166/twapp-macos-aarch64.tar.gz"
    sha256 "297511066d688b9b43c0f0d6beee9e9f30ee93ff08f02d54fbe8c937eb9ad69d"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.166/twapp-macos-x86_64.tar.gz"
    sha256 "0fc4d3c2eed6e9cf59fa87c2e7420ac965ca360f6b90c990a7a1bdf081e82a8c"
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
