class SlackCli < Formula
  desc "Command-line interface for Slack"
  homepage "https://github.com/piekstra/slack-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/slack-cli/releases/download/v1.1.0/slack-cli_v1.1.0_darwin_arm64.tar.gz"
      sha256 "79255bc29548d456b5accef18b9e9b97e61821cc6eaf4019182b5766f2a1b3f3"
    end
    on_intel do
      url "https://github.com/piekstra/slack-cli/releases/download/v1.1.0/slack-cli_v1.1.0_darwin_amd64.tar.gz"
      sha256 "5c8e847cf78fe57c442cd08af53091b823b3f33e18855fdf9b5e726ca3f02748"
    end
  end

  def install
    bin.install "slack-cli"
  end

  def caveats
    <<~EOS
      To configure slack-cli, run:
        slack-cli config set-token <your-slack-api-token>

      Or set the SLACK_API_TOKEN environment variable.
    EOS
  end

  test do
    assert_match "slack-cli", shell_output("#{bin}/slack-cli --help")
  end
end
