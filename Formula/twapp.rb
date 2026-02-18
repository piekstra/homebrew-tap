class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.47"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.47/twapp-macos-aarch64.tar.gz"
    sha256 "66aeb219a93a717ba40a6a4f31ae8ea38beb7dc1ea4db256a60f3c2a05123434"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.47/twapp-macos-x86_64.tar.gz"
    sha256 "7e4226055bef0b9af3a82ee31586b1181b8297cc2be8670f45c066eabbfa1eda"
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
