class Tplc < Formula
  desc "CLI for TP-Link Cloud API - control Kasa and Tapo smart home devices"
  homepage "https://github.com/piekstra/tplink-cloud-cli"
  license "GPL-3.0"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.4/tplc-macos-aarch64"
      sha256 "d769786ffc009937e3d91d521e46bda67e80f42e4ef977e32753af772711eded"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.4/tplc-macos-x86_64"
      sha256 "a4517ca669282177fb02d495c147f1089acc817bb0e92b13ac1016a3e583f659"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.4/tplc-linux-aarch64"
      sha256 "114a2c1bc5e3a179978cc74aa9040f671c62834b2477b0ba8eb31232114b4ef4"
    else
      url "https://github.com/piekstra/tplink-cloud-cli/releases/download/v0.1.4/tplc-linux-x86_64"
      sha256 "1deb0917ea8dd7aafb64067a607a342822ca910e996cdfb0144d440ddbb4101e"
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
