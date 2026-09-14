class Tplc < Formula
  desc "TP-Link Kasa and Tapo smart-home devices from the terminal"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.2/tplc-aarch64-apple-darwin.tar.gz"
      sha256 "e21ba9d8ecd5fbd9608a06fa7c2f43f1d6c71ac132ebde2cc349724ce06223a3"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.2/tplc-x86_64-apple-darwin.tar.gz"
      sha256 "a79cb947475ffb05b8f56be289f7b20be154e48760e9cc343541d632ba08ec04"
    end
  end

  on_linux do
    url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.2/tplc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c421440290e3ea9f693f76620697f7339fbc0d1a3c83f6ee2df7c990415486e3"
  end

  def install
    bin.install "tplc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tplc --version")
  end
end
