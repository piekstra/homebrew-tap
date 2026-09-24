class Twapp < Formula
  desc "A structured terminal companion for Claude and Codex coding sessions"
  homepage "https://github.com/piekstra/twapp"
  license "MIT"
  version "0.6.156"

  depends_on :macos

  on_arm do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.156/twapp-macos-aarch64.tar.gz"
    sha256 "a8a1f911753c3756acd30e4499b22f7ab06f108027a649c7ddf634e978660e66"
  end

  on_intel do
    url "https://github.com/piekstra/twapp/releases/download/v0.6.156/twapp-macos-x86_64.tar.gz"
    sha256 "a6f3607dd51989a8906f01a74e7b1d692dc3d856a8374dc01327424ac3d786b5"
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
