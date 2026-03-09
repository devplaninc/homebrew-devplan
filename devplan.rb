class Devplan < Formula
  desc "AI-powered development planning and task management CLI"
  homepage "https://github.com/devplaninc/devplan-cli"
  version "0.69.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-arm64-noautoupdate.tar.gz"
      sha256 "6e258eaa253b44962eb11eba7b5803ce2882594a590eca1eadcb55d4e4361625"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-amd64-noautoupdate.tar.gz"
      sha256 "c2bbdb5038d396f8564634e85f3518301e0e962461a615ec05bf9a2bf3905ad6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-arm64-noautoupdate.tar.gz"
      sha256 "be270a88eef29f94e18313c3386e7558a77ff564c4b27f45720af37b78ca1531"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-linux-amd64-noautoupdate.tar.gz"
      sha256 "a9d2c23a248495ffcf964dc32b01efcc0719c4ce8a846f5c953180089926e66f"
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
