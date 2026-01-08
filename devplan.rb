class Devplan < Formula
  desc "AI-powered development planning and task management CLI"
  homepage "https://github.com/devplaninc/devplan-cli"
  version "0.62.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-arm64-noautoupdate.tar.gz"
      sha256 "309c6d8e3a4d206a9dec70bc97e1673e6ca7db0e7c9c65237bb51c843a28a94a"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-amd64-noautoupdate.tar.gz"
      sha256 "b545a3463a45f513a6cb835b0456ef776b5efa20ede0093028bf81372cc3525c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-arm64-noautoupdate.tar.gz"
      sha256 "58641c8f6d27aede1c2c5adfd858d0b1b577a073c3e3db4b0642da1956e55c37"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-amd64-noautoupdate.tar.gz"
      sha256 "5a5a7cec1e975bf18981c5ca31f4dfadbd618c4f814a6f920470b38eace748e8"
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
