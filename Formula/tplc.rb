class Tplc < Formula
  desc "CLI for TP-Link Cloud API - control Kasa and Tapo smart home devices"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.5/tplc-macos-aarch64"
      sha256 "d5b27563da50d977d0d1ef28fadd447213c0647612e8be3d5b75eea5a978554d"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.5/tplc-macos-x86_64"
      sha256 "87a81eddc9a4970250ba26ac3a2dbd1252ab0b8b1363b14b1159bad3471abdce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.5/tplc-linux-aarch64"
      sha256 "0f0cb47bfbb43fb288f968c421b49fa50a654deca18b5dcddfe05d3e598bc75a"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.5/tplc-linux-x86_64"
      sha256 "640967e7f291774d7041e5a7e2608bf9fd9a94f2de6f6d9ddb35edfc056ea2d2"
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
