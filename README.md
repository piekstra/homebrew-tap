# homebrew-tap

Homebrew tap for my personal tools.

## Installation

```bash
brew tap piekstra/tap
```

## Available Formulae

### slack-cli

A command-line interface for Slack.

```bash
brew install piekstra/tap/slack-cli
```

## Updating Formulae

After creating a new release:

1. Build release archives:
   ```bash
   cd slack-cli
   make release VERSION=1.0.0
   make checksums
   ```

2. Upload archives to GitHub release

3. Update formula with new SHA256 checksums:
   ```bash
   # In homebrew-tap/Formula/slack-cli.rb
   # Update version and sha256 values
   ```

4. Push changes to tap repo
