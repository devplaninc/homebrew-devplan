# homebrew-devplan

Official Homebrew tap for the [devplan CLI](https://github.com/devplaninc/devplan) - an AI-powered development planning and task management tool.

## Installation

To install devplan via Homebrew, first add this tap:

```bash
brew tap devplaninc/devplan
```

Then install devplan:

```bash
brew install devplaninc/devplan/devplan
```

Or do both in one command:

```bash
brew install devplaninc/devplan/devplan
```

## Updating

To update devplan to the latest version:

```bash
brew upgrade devplaninc/devplan/devplan
```

## Important Notes

⚠️ **Auto-update is disabled in Homebrew builds**

The devplan CLI installed via Homebrew has its internal auto-update functionality disabled. This ensures compatibility with Homebrew's package management system.

- ✅ **Update via Homebrew**: `brew upgrade devplaninc/devplan/devplan`
- ❌ **Internal updater not available**: The CLI's built-in update command is disabled

This design prevents conflicts between Homebrew's package management and the CLI's internal updater.

## Supported Architectures

This formula supports the following macOS architectures:
- Intel (x86_64/amd64)
- Apple Silicon (arm64)

The formula automatically detects your architecture and installs the appropriate binary.

## Verification

Each binary is verified using SHA256 checksums to ensure integrity and authenticity.

## Formula Updates

The formula is updated automatically when new versions of devplan are released. Updates are managed through GitHub Actions and include:
- Version updates
- Binary URL updates
- SHA256 checksum updates

## Manual update:
   ```bash
   # Download the binaries
   curl -L -o devplan-darwin-amd64 "https://github.com/devplaninc/devplan/releases/download/v1.0.0/devplan-darwin-amd64"
   curl -L -o devplan-darwin-arm64 "https://github.com/devplaninc/devplan/releases/download/v1.0.0/devplan-darwin-arm64"
   
   # Calculate SHA256 checksums
   sha256sum devplan-darwin-amd64
   sha256sum devplan-darwin-arm64
   
   # Update devplan.rb with the version and checksums
   # Replace "1.0.0" with actual version
   # Replace "PLACEHOLDER_AMD64_SHA256" with actual AMD64 checksum
   # Replace "PLACEHOLDER_ARM64_SHA256" with actual ARM64 checksum
   ```

### Testing the Formula

Before releasing, test the formula locally:

```bash
# Install from local file
brew install --build-from-source ./devplan.rb

# Test installation
devplan --version

# Uninstall
brew uninstall devplan
```
