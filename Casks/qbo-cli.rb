cask "qbo-cli" do
  name "qbo-cli"
  desc "Command-line interface for QuickBooks Online"
  homepage "https://github.com/piekstra/qbo-cli"
  version "1.0.0"

  binary "qbo-cli"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/qbo-cli/releases/download/v#{version}/qbo-cli_v#{version}_darwin_arm64.tar.gz"
      sha256 "a6f369382a75d32c7f88d39f30ab8f71fd5b7f84ef1435d5ea2e140653e8af4c"
    end
    on_intel do
      url "https://github.com/piekstra/qbo-cli/releases/download/v#{version}/qbo-cli_v#{version}_darwin_amd64.tar.gz"
      sha256 "b114ba309a3b5bccce56ceabcdc0f05cac6ea401e497f6d5a818797a6ff2878e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/qbo-cli/releases/download/v#{version}/qbo-cli_v#{version}_linux_arm64.tar.gz"
      sha256 "aae08af19312989a5c7a49dc0ecf54dba7e4da7859d3a123cbf93b11eb92f495"
    end
    on_intel do
      url "https://github.com/piekstra/qbo-cli/releases/download/v#{version}/qbo-cli_v#{version}_linux_amd64.tar.gz"
      sha256 "9bc0c6698ea6b17a6328dffbaf12157734e1a957853bc56a444b39652571595c"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/qbo-cli"]
  end

  caveats <<~EOS
    To get started with qbo-cli:

    1. Configure your OAuth client credentials:
       qbo-cli auth setup

    2. Authorize a QuickBooks company:
       qbo-cli auth login

    3. Check status:
       qbo-cli auth status

    On macOS, your credentials are stored securely in the system Keychain.
    On Linux, credentials are stored in ~/.config/qbo-cli/credentials.

    For more information, run: qbo-cli --help
  EOS
end
