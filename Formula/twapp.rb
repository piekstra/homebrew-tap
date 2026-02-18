class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.46"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.46/twapp-macos-aarch64.tar.gz"
    sha256 "0b2db329f98a4167431ef5ea53020d3f0822923cd696833e626dbfaedb3587af"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.46/twapp-macos-x86_64.tar.gz"
    sha256 "35771536d59f6e80b210a233b490d0ca3722502b87506cc38fc26901aa80cb8c"
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

      twapp requires the Claude CLI: https://docs.anthropic.com/en/docs/claude-cli
    EOS
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/twapp --version")
  end
end
