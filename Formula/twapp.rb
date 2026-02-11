class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.30"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.30/twapp-macos-aarch64.tar.gz"
    sha256 "fe47dc0fde8891651a514d21a08e3b88997edc3a772be49dceff61fb41c2552a"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.30/twapp-macos-x86_64.tar.gz"
    sha256 "0ace9e1736e3281febb8fba04bc4a80da619e2936677bce0b4e33307d1ff227b"
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
