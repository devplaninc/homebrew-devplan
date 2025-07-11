class Devplan < Formula
  desc "AI-powered development planning and task management CLI"
  homepage "https://github.com/devplaninc/devplan-cli"
  version "0.34.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-arm64-noautoupdate.tar.gz"
      sha256 "e46835eb27bfb13cbee89e3709ea542a6e67927a550b3fd27779e2412b511fef"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-amd64-noautoupdate.tar.gz"
      sha256 "a3f24b9744e4651fb93c30b5a5e10687177f461d6c5d0ddb4f5bf6abbb9bc546"
    end
  end

  def install
    bin.install Dir["devplan-*"].first => "devplan"
  end

  def caveats
    <<~EOS
      Auto-update is disabled in this Homebrew build.

      To update devplan, use Homebrew:
        brew upgrade devplan

      The CLI's internal updater is not available for Homebrew installations.
      This ensures compatibility with Homebrew's package management system.

      For more information about Devplan, visit: https://devplan.com
    EOS
  end

  test do
    system "#{bin}/devplan", "--version"
  end
end
