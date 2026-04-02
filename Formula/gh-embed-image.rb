class GhEmbedImage < Formula
  desc "Upload images to GitHub's native asset storage from the CLI"
  homepage "https://github.com/piekstra/github-embed-images"
  url "https://github.com/piekstra/github-embed-images/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "9de7e3311fc31ff714790b4c0c0fdc40cb7b7d4a9c87bda5cc4ceec1772d4c6a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "ci", "--ignore-scripts"
    libexec.install Dir["*"]
    libexec.install ".gitignore"
    (bin/"gh-embed-image").write_env_script(
      libexec/"gh-embed-image",
      PATH: "#{Formula["node"].opt_bin}:$PATH"
    )
  end

  def caveats
    <<~EOS
      First-time setup: run `gh-embed-image --login` to authenticate with GitHub.
      This opens a browser window for GitHub login. Session is saved to:
        ~/.config/gh-embed-image/session.json

      SECURITY: This file contains GitHub session cookies. See the README for details:
        https://github.com/piekstra/github-embed-images#security-risks

      Requires Playwright Chromium. If not already installed:
        npx playwright install chromium
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gh-embed-image --help")
  end
end
