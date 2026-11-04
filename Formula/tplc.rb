class Tplc < Formula
  desc "TP-Link Kasa and Tapo smart-home devices from the terminal"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.4.0/tplc-aarch64-apple-darwin.tar.gz"
      sha256 "d78a7d59c8a9b79be0b72d81371999fb5fe1f4228c54ef700ede7c4fe49ff994"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.4.0/tplc-x86_64-apple-darwin.tar.gz"
      sha256 "dec7baa1c6ccc0e87c4e61ac6dc10970a8d74f37f7b8e9bc3b28445015d63f78"
    end
  end

  on_linux do
    url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.4.0/tplc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b88d098d63661cccd9b66470093491011977249f3da3a8625eb19a5e40c1604b"
  end

  def install
    bin.install "tplc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tplc --version")
  end
end
