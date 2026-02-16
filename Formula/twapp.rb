class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.34"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.34/twapp-macos-aarch64.tar.gz"
    sha256 "94acc71300c4ba188e9a499eb61382c8ace9d268ccc80bb329efc5b54f5d2178"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.34/twapp-macos-x86_64.tar.gz"
    sha256 "a03b22d96c722a518c5c3b4054dee354b8aa40d4a33adc9ed5a939bd6dc1b9af"
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
