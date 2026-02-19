class Twapp < Formula
  desc "A structured terminal companion for Claude coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.52"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.52/twapp-macos-aarch64.tar.gz"
    sha256 "05f60d12396a8e6149a878307bba315e8ec51cbe58e6e636bfe64dd83f9ce25b"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.52/twapp-macos-x86_64.tar.gz"
    sha256 "e6b20aad7344a6a4d84f6f36e752f6b79c46fd31f6b44f8e944711eb5b1c7d5e"
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
