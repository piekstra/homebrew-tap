class Tplc < Formula
  desc "TP-Link Kasa and Tapo smart-home devices from the terminal"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.1/tplc-aarch64-apple-darwin.tar.gz"
      sha256 "dff163d7827a6d6ea09044526416cc308fa5fd7238f2ee3accf201eefad4fb0d"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.1/tplc-x86_64-apple-darwin.tar.gz"
      sha256 "f75ad50826a37d33b41009e49382b4982e6504f38129f1f000985d9d330daf48"
    end
  end

  on_linux do
    url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.2.1/tplc-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "df3015b869b49a702511a046d866c73ba3177bfec16f5ae5898decc627b407a9"
  end

  def install
    bin.install "tplc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tplc --version")
  end
end
