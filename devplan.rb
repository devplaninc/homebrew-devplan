class Devplan < Formula
  desc "AI-powered development planning and task management CLI"
  homepage "https://github.com/devplaninc/devplan-cli"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-arm64-noautoupdate.tar.gz"
      sha256 "462318b3d0f5e7ad9d0251844484d0a97b4d6e81d3b3f6e14b3d91f44b6bbb65"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-amd64-noautoupdate.tar.gz"
      sha256 "a9b9ebacdcc876da7e1d67ac0094b0bf4d3c357cb4652820fccd3771c575aca5"
    end
  end

  def install
    bin.install Dir["devplan-*"].first => "devplan"
  end

  def caveats
    <<~EOS
      Auto-update is disabled in this Homebrew build.

      To update devplan, use Homebrew:
        brew upgrade devplaninc/devplan/devplan

      The CLI's internal updater is not available for Homebrew installations.
      This ensures compatibility with Homebrew's package management system.

      For more information, visit: https://github.com/devplaninc/devplan-cli
    EOS
  end

  test do
    system "#{bin}/devplan", "--version"
  end
end
