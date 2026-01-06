class SlackCli < Formula
  desc "Command-line interface for Slack"
  homepage "https://github.com/piekstra/slack-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/slack-cli/releases/download/v1.0.0/slack-cli_1.0.0_darwin_arm64.tar.gz"
      sha256 "0d610770b1197cef22a54564554fd42eafebbefc141c957fed98a509e0f4da4c"
    end
    on_intel do
      url "https://github.com/piekstra/slack-cli/releases/download/v1.0.0/slack-cli_1.0.0_darwin_amd64.tar.gz"
      sha256 "3bc16ad0653591fe045e16ee8529d09416e84f2cbac79d7753c688a79ee5978c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/slack-cli/releases/download/v1.0.0/slack-cli_1.0.0_linux_arm64.tar.gz"
      sha256 "64acf4059c78a980d0a5ee7f8b34cafa2db4ef7b5a64826de4f1191ad526c187"
    end
    on_intel do
      url "https://github.com/piekstra/slack-cli/releases/download/v1.0.0/slack-cli_1.0.0_linux_amd64.tar.gz"
      sha256 "29b46a8e0fc6957e09339c12fe2766071cb4aee166056e3af85487b1d90bb15d"
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
