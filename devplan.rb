class Devplan < Formula
  desc "AI-powered development planning and task management CLI"
  homepage "https://github.com/devplaninc/devplan-cli"
  version "0.73.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-arm64-noautoupdate.tar.gz"
      sha256 "fd28472d046b7ac7746d0ed9376ae2cf42c303c1de21b38c89726a3b42e91915"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-amd64-noautoupdate.tar.gz"
      sha256 "d694850fc1cee695559d5c4d6199d471d555c023c8c7c77881d4263a422b6e5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-arm64-noautoupdate.tar.gz"
      sha256 "84e12d81a8c5c2eaa1a555ea7d7c61052cc789b9e8519255cde0613615035f51"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-amd64-noautoupdate.tar.gz"
      sha256 "93f034410d2561d4c72b2672a159338040452ebfe809413579e21815719922af"
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
