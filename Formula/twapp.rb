class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.5.78"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.78/twapp-macos-aarch64.tar.gz"
    sha256 "04ac4a61e4730c61786f155bf727327ffa12eb8ab10c88bba22ffb13487c5492"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.5.78/twapp-macos-x86_64.tar.gz"
    sha256 "e7312fe42650ba32b357b9d7c9c49eb401df2a25d15c62ca48553d2a4ed0dc27"
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

      twapp requires at least one supported agent CLI:
        Claude CLI: https://docs.anthropic.com/en/docs/claude-cli
        Codex CLI: https://github.com/openai/codex
    EOS
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/twapp --version")
  end
end
