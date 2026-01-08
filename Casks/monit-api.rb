cask "monit-api" do
  name "monit-api"
  desc "Command-line interface for Monit APIs"
  homepage "https://github.com/piekstra/monit-api"
  version "0.3.0"

  binary "monit-api"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "492b2201971da72ccd9bbaa18362bd47d299cfd99022f09ce5d721bc04f9d51c"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "f1dc78ff755d21a3bb8a54ae5f0609f5e5d30665d00e86bd2016181e5b078394"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_arm64.tar.gz"
      sha256 "b09012e10119cda13ca9e3a023b0f2f55586bed02d69220a5585963646b66029"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_amd64.tar.gz"
      sha256 "1db548bb7cf4696b8a10210dd0f1414fe2b9bda9890c515da0ef30fd2c8e7982"
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
