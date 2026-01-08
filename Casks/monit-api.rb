cask "monit-api" do
  name "monit-api"
  desc "Command-line interface for Monit APIs"
  homepage "https://github.com/piekstra/monit-api"
  version "0.2.0"

  binary "monit-api"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "5a78758ee82fd9ba31f350ebdf974f646cc329d60815f508de8a1489bd875519"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "9b98718f29bc4c05ae273954da21255d00d51ba8bc7a633c6e360baa3f329dc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_arm64.tar.gz"
      sha256 "86d2f4beb170b7bc1f3e9bcfa78370afc75bd88828f38d5b7807f7cc55c0572a"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_amd64.tar.gz"
      sha256 "95ec8f61d0ec73810de473ae29e1caa5621701e8a0aab9794937ddbdbdf8bb4f"
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
