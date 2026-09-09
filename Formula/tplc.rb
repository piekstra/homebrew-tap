class Tplc < Formula
  desc "CLI for TP-Link Cloud API - control Kasa and Tapo smart home devices"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.7/tplc-macos-aarch64"
      sha256 "9a91283b9740c39f8ddcdca53a5c46dd71b36acbeef38d9c2f98727174d299f4"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.7/tplc-macos-x86_64"
      sha256 "e86dde6203d0716ca3381bb05b12403b7792759646f5b7e2df961f5069812884"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.7/tplc-linux-aarch64"
      sha256 "92a68670ef6e73ef9fdec494839032975f31494374f8036c6ebddbccb36f7be1"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.7/tplc-linux-x86_64"
      sha256 "7351705e67eeb943c78a08ad7e06e680907b1949da3802d90ee463cbfa1aeced"
    end
  end

  def install
    binary = Dir["tplc-*"].first || "tplc"
    mv binary, "tplc"
    bin.install "tplc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tplc --version")
  end
end
