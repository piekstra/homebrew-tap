cask "monit-api" do
  name "monit-api"
  desc "Command-line interface for Monit APIs"
  homepage "https://github.com/piekstra/monit-api"
  version "0.1.0"

  binary "monit-api"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "4ff65384a4a220fd188ad9e98b1b7a99a8de97a015199231ca602c0132e96af0"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "04bae9a4462c5e5a2abfeb64783cb4a5f825fd05f021aba541d359d367b7da5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_arm64.tar.gz"
      sha256 "c20a58498997292b9e4a4c284b4ad8e30bcee2de914afc2a01779f0de23d1521"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_amd64.tar.gz"
      sha256 "21babd9ca80202268769b62ec63c44bcd00da533444eedece97f1fcd771b4b6f"
    end
  end

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/monit-api"]
  end

  caveats <<~EOS
    To configure monit-api, run:
      monit-api config set-token <your-jwt-token>
      monit-api config set-tenant <your-tenant-id>
      monit-api config use <environment>  # prod, dev, uat, xbox
  EOS
end
