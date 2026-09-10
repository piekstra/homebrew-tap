class Tplc < Formula
  desc "TP-Link Kasa and Tapo smart-home devices from the terminal"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.0/tplc-aarch64-apple-darwin.tar.gz"
      sha256 "ec0430dc6c0c5c4f380d5fd2eb37422c5842248cf504c658fefb756d371bba12"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.0/tplc-x86_64-apple-darwin.tar.gz"
      sha256 "533d36a2a06e6900bb06cb8bc27e3acd83fb9dcf48b480b8cee37e2443712451"
    end
  end

  on_linux do
    url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.0/tplc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b00b19c3b31111acc37bab28878149dd51427e3d46b3d984fe91534e1bbdb7a0"
  end

  def install
    bin.install "tplc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tplc --version")
  end
end
