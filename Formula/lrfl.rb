class Lrfl < Formula
  desc "Loxahatchee River District utility accounts, billing, and payments from the CLI"
  homepage "https://github.com/piekstra/loxahatchee-river-fl-cli"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/piekstra/loxahatchee-river-fl-cli/releases/download/v0.4.0/lrfl-aarch64-apple-darwin.tar.gz"
      sha256 "1b63b19b50ac7824fa436318c1b75c6abacd1e42d3ab59d96cd0315c3196fb94"
    end
    on_intel do
      url "https://github.com/piekstra/loxahatchee-river-fl-cli/releases/download/v0.4.0/lrfl-x86_64-apple-darwin.tar.gz"
      sha256 "023ac986e051ad32e364666a5de6554504427de0ce294c85175795f9a3ba3fdb"
    end
  end

  on_linux do
    # Secret Service backend for the OS keychain (used by `lrfl login`/`auth`).
    depends_on "dbus"

    on_intel do
      url "https://github.com/piekstra/loxahatchee-river-fl-cli/releases/download/v0.4.0/lrfl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "367a9ea4cd9872ba0d5be8b5012e6d9970e53b2249e54686b49a20e24c853cf8"
    end
  end

  def install
    bin.install "lrfl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lrfl --version")
  end
end
