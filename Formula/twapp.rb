class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  url "https://github.com/piekstra/twapp/releases/download/v0.4.5/twapp-macos-aarch64.tar.gz"
  sha256 "5d1952f19a977833869f69e2d580fc82c9df218d8e81077c3118d2c8d834b800"
  license "MIT"
  version "0.4.5"

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
        twapp install-gui #{prefix}/twapp.app

      twapp requires the Claude CLI: https://docs.anthropic.com/en/docs/claude-cli
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/twapp --version")
  end
end
