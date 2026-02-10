class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.22"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.22/twapp-macos-aarch64.tar.gz"
    sha256 "712db006711eecdb5a1c8211ab577591c0842c859b70c2c16bba7fb95b7b12d7"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.22/twapp-macos-x86_64.tar.gz"
    sha256 "e89b3f7d5b7b69b23c7616607d7299834ea60bf049850592584b775709e24910"
  end

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
