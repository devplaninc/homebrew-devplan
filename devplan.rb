class Devplan < Formula
  desc "AI-powered development planning and task management CLI"
  homepage "https://github.com/devplaninc/devplan-cli"
  version "0.59.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-arm64-noautoupdate.tar.gz"
      sha256 "8cd3fb72629fff9353487f568898297f78da9d54318addb800e0c3f3a104af17"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-amd64-noautoupdate.tar.gz"
      sha256 "ca431d5713f9478095811f6e6a627c5a4d4d44d627f9df13874ddd792add7f23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-arm64-noautoupdate.tar.gz"
      sha256 "7ec0852e454f650c977460c6724dc4bcb0caa28d5145c7e4bc0037c2a4b0ba53"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-amd64-noautoupdate.tar.gz"
      sha256 "75d6186330843e3cd41ee7be002323f95f354b2adbe83b074342992ee0d87bc5"
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
