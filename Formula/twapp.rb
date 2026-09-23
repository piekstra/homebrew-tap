class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.6.117"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.117/twapp-macos-aarch64.tar.gz"
    sha256 "08f7cd45c7367bd8312cbddf852ea8b6c85e3c02c3533363d80e7a81a7b22a05"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.117/twapp-macos-x86_64.tar.gz"
    sha256 "6e3eebbb95913875f9269a6ce47540554b59a0b5336444a25a66b33832a378c3"
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
