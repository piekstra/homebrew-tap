class Tplc < Formula
  desc "TP-Link Kasa and Tapo smart-home devices from the terminal"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.3/tplc-aarch64-apple-darwin.tar.gz"
      sha256 "a4806d02503b8c46f4f45903316ac957f9a8c558119bfd0bc72ed218f4d95d41"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.3/tplc-x86_64-apple-darwin.tar.gz"
      sha256 "2bea713104a5fc99f516b6e8aadb6bf6b4e599e5afd9f5e8b69676b56ecdecda"
    end
  end

  on_linux do
    url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.3/tplc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e51b8404565ae252076011a578f89a049c8c05cc084e57fd7d397fd803de71a9"
  end

  def install
    bin.install "tplc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tplc --version")
  end
end
