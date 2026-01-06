class NewrelicCli < Formula
  desc "Command-line interface for New Relic"
  homepage "https://github.com/piekstra/newrelic-cli"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "061c648bb20cb6697af9e7bc02ae50bcd48110aaa3cf49357768756dbf31ed07"
    end
    on_intel do
      url "https://github.com/piekstra/newrelic-cli/releases/download/v#{version}/newrelic-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "fc288b45d2d5b11084a03ee0c3b89288138d9271f60dce93fae7b55179d85bc9"
    end
  end

  def install
    bin.install "newrelic-cli"
  end

  def caveats
    <<~EOS
      To configure newrelic-cli, run:
        newrelic-cli config set-api-key
        newrelic-cli config set-account-id <your-account-id>

      Or set environment variables:
        NEWRELIC_API_KEY
        NEWRELIC_ACCOUNT_ID
        NEWRELIC_REGION (US or EU)
    EOS
  end

  test do
    assert_match "newrelic-cli", shell_output("#{bin}/newrelic-cli --help")
  end
end
