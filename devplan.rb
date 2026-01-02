class Devplan < Formula
  desc "AI-powered development planning and task management CLI"
  homepage "https://github.com/devplaninc/devplan-cli"
  version "0.58.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-arm64-noautoupdate.tar.gz"
      sha256 "d544b1f763121806482a9974e75d60aa8a5180764d3cc0c8cc4dc86ee6b01ae5"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-amd64-noautoupdate.tar.gz"
      sha256 "5bf8e2191d910f358d2bfe8db425fd4f312ea210f2d05fd61e2a59182b5025c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-arm64-noautoupdate.tar.gz"
      sha256 "195288f4926c3753b6f227bc3870f0f8fc20d6f432d0702a088d0a93a55a844d"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-amd64-noautoupdate.tar.gz"
      sha256 "2b75ed3bf1ec226541c898f8928ef8f224a0167a57da4606f1ee93008982267e"
    end
  end

  def install
    # Install the CLI binary into libexec (not on PATH)
    libexec.install Dir["devplan-*"].first => "devplan-cli"

    # Modify the wrapper script to point to the correct binary location
      inreplace "devplan.sh", 'BINARY_RELATIVE_DIR=""', 'BINARY_RELATIVE_DIR="../libexec/"'

      # Install bash wrapper
      bin.install "devplan.sh" => "devplan"

    # Ensure wrapper can find the CLI
    (bin/"devplan").chmod 0755
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
