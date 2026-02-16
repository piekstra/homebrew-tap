class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.40"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.40/twapp-macos-aarch64.tar.gz"
    sha256 "cb96896810089d0a17a5676e7b7a1a2aeb9cc34793e81871a2c4c53fb243bbd0"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.40/twapp-macos-x86_64.tar.gz"
    sha256 "4b0589e74500a12ee7495a61dc2797d2bb3c8a16e077a340a4e4993dda51246f"
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
