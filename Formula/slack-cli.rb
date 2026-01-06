class SlackCli < Formula
  desc "Command-line interface for Slack"
  homepage "https://github.com/piekstra/slack-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/slack-cli/releases/download/v#{version}/slack-cli_#{version}_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64"
    end
    on_intel do
      url "https://github.com/piekstra/slack-cli/releases/download/v#{version}/slack-cli_#{version}_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_AMD64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/slack-cli/releases/download/v#{version}/slack-cli_#{version}_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/piekstra/slack-cli/releases/download/v#{version}/slack-cli_#{version}_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_AMD64"
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

      For shell completions, run:
        slack-cli completion bash > $(brew --prefix)/etc/bash_completion.d/slack-cli
        slack-cli completion zsh > $(brew --prefix)/share/zsh/site-functions/_slack-cli
    EOS
  end

  test do
    assert_match "slack-cli", shell_output("#{bin}/slack-cli --help")
  end
end
