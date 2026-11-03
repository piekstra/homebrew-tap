class Tplc < Formula
  desc "TP-Link Kasa and Tapo smart-home devices from the terminal"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.3.0/tplc-aarch64-apple-darwin.tar.gz"
      sha256 "6ae48ac16f669c14def161b44aeb2fe668fa5f45eb16eff44226c3ebbf5e4137"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.3.0/tplc-x86_64-apple-darwin.tar.gz"
      sha256 "e0a442aadf0703ecadbef8255c53d23b8eaffa131e0a3a026d8e47349d6ba898"
    end
  end

  on_linux do
    url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.3.0/tplc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b1880351bd1b4f49c02e815f8e9c1b1bf872be842aae3ecc5bfeb57e808ca10e"
  end

  def install
    bin.install "tplc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tplc --version")
  end
end
