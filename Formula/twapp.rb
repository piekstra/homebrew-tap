class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  url "https://github.com/piekstra/twapp/releases/download/v0.5.11/twapp-macos-aarch64.tar.gz"
  sha256 "463c73bacec1904e0824012ef5265f1693c39fe0a169590bec73cee727fe8e88"
  license "MIT"
  version "0.5.11"

  depends_on :macos
  depends_on arch: :arm64

  def install
    prefix.install "twapp.app"
    bin.install_symlink prefix/"twapp.app/Contents/MacOS/twapp"
  end

  def caveats
    <<~EOS
      twapp has been installed as a macOS app bundle.

      To avoid repeated macOS permission prompts, create a local code signing certificate:
        twapp setup-cert
        twapp install-gui \#{prefix}/twapp.app

      twapp requires the Claude CLI: https://docs.anthropic.com/en/docs/claude-cli
    EOS
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/twapp --version")
  end
end
