class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.6.208"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.208/twapp-macos-aarch64.tar.gz"
    sha256 "eb34b33e38b091824b1c1d9241966f8c85c5745ec491243005883ef582ac789a"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.208/twapp-macos-x86_64.tar.gz"
    sha256 "fd03dc936c53f6c1fc0581e53eaedac2617b07dce59446ecf2b41e5d29a0363f"
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
