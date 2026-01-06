cask "slack-cli" do
  name "slack-cli"
  desc "Command-line interface for Slack"
  homepage "https://github.com/piekstra/slack-cli"
  version "1.2.0"

  binary "slack-cli"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/slack-cli/releases/download/v#{version}/slack-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "4e7dda8a7e86447cd347fdf1f8028bd652a1f7c640aee3428d852fc7e9bfd17c"
    end
    on_intel do
      url "https://github.com/piekstra/slack-cli/releases/download/v#{version}/slack-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "77de7e1e645fe7f6dcf8f62330944bbf941fb10d935dd305c12835261815346b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/slack-cli/releases/download/v#{version}/slack-cli_v#{version}_linux_arm64.tar.gz"
      sha256 "ba6207f0b8f05ecf6fbc7a96480abe3bfa0d8bf1cb668e15f420e68232a24513"
    end
    on_intel do
      url "https://github.com/piekstra/slack-cli/releases/download/v#{version}/slack-cli_v#{version}_linux_amd64.tar.gz"
      sha256 "d90227bf7618081136ff561cf04091ad6c20887a1f4a257b41ba8abaa92fe0a2"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/slack-cli"]
  end

  caveats <<~EOS
    To configure slack-cli, run:
      slack-cli config set-token

    On macOS, your token is stored securely in the system Keychain.
    On Linux, your token is stored in ~/.config/slack-cli/credentials.
  EOS
end
