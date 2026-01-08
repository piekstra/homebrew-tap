cask "monit-api" do
  name "monit-api"
  desc "Command-line interface for Monit APIs"
  homepage "https://github.com/piekstra/monit-api"
  version "0.4.0"

  binary "monit-api"

  on_macos do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_arm64.tar.gz"
      sha256 "9e0c470b646d802a4f05daa6dd3ec8ad1bb3662fcd0fa0649b1cfcd7d6e79a1a"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_darwin_amd64.tar.gz"
      sha256 "0cc70ba43acdec3be3213ee210f1120083cb70dc2498eb436492ddaffdd0327a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_arm64.tar.gz"
      sha256 "bcada30cd894b33acb54c0210b7b39f362ae6d119513aa1d8463e9e6441abbee"
    end
    on_intel do
      url "https://github.com/piekstra/monit-api/releases/download/v#{version}/monit-api_v#{version}_linux_amd64.tar.gz"
      sha256 "78b637523f8720d8292b57f4cb5524c566d2a00a912a9c5ebe23684254bcd428"
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
