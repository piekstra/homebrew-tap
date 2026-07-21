class Lrfl < Formula
  desc "Loxahatchee River District utility accounts, billing, and payments from the CLI"
  homepage "https://github.com/piekstra/loxahatchee-river-fl-cli"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/piekstra/loxahatchee-river-fl-cli/releases/download/v0.5.0/lrfl-aarch64-apple-darwin.tar.gz"
      sha256 "5d81d0482ac8c9e2ad93678c46f3990e3cac3d6820cb8854b5954e52fb18b302"
    end
    on_intel do
      url "https://github.com/piekstra/loxahatchee-river-fl-cli/releases/download/v0.5.0/lrfl-x86_64-apple-darwin.tar.gz"
      sha256 "de3476ab60cde09a8789a4f8c568d6d92be5cc79b1596e0d45938b6da1fcd502"
    end
  end

  on_linux do
    # Secret Service backend for the OS keychain (used by `lrfl login`/`auth`).
    depends_on "dbus"

    on_intel do
      url "https://github.com/piekstra/loxahatchee-river-fl-cli/releases/download/v0.5.0/lrfl-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d636737b696403789165115ad586746865cfa2fc6671216d3ba13361468a1da5"
    end
  end

  def install
    bin.install "lrfl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lrfl --version")
  end
end
