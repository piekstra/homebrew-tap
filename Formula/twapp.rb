class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  url "https://github.com/piekstra/twapp/releases/download/v0.5.14/twapp-macos-aarch64.tar.gz"
  sha256 "64647b9626e50d36d38184210120351ff2d871fd20976a8aa37839c4c9456c4c"
  license "MIT"
  version "0.5.14"

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
