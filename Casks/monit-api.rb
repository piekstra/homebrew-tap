cask "monit-api" do
  name "monit-api"
  desc "Command-line interface for Monit APIs"
  homepage "https://github.com/piekstra/monit-api"
  version "0.4.1"

  binary "monit-api"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "086199022bec4f779f50a879b380a67e76e3e7e6f71ddbad1ee161244a74b5d5"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "4e911520c4f3be96c3195932d59b082a0da731fe55b3c7b7981cc80864139932"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_arm64.tar.gz"
      sha256 "212178d8ad87a46837f21585088b37086b429bdf5fd41cd12a7b5ed80fe39511"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_amd64.tar.gz"
      sha256 "e9bdac051532a57131104f53efb3de900556f6c0151150a739c76beff2a1f7df"
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
