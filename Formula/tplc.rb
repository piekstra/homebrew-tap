class Tplc < Formula
  desc "TP-Link Kasa and Tapo smart-home devices from the terminal"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.3.1/tplc-aarch64-apple-darwin.tar.gz"
      sha256 "b41c18f577ec72a3ea748d76bb6ddac056d9888a59e3d1d5e82de77d694be549"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.3.1/tplc-x86_64-apple-darwin.tar.gz"
      sha256 "d646e8d729589c4f45e08de832668818d1ea8cff5e5804dfa26eb2594330ee9d"
    end
  end

  on_linux do
    url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.3.1/tplc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "200f9933c11dd9f819e96a961293fdc919abdc242c6fb8fbb7299a09cee78ef1"
  end

  def install
    bin.install "tplc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tplc --version")
  end
end
