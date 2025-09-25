class Devplan < Formula
  desc "AI-powered development planning and task management CLI"
  homepage "https://github.com/devplaninc/devplan-cli"
  version "0.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-arm64-noautoupdate.tar.gz"
      sha256 "86dc44af710c582a82f0ce7c507a98d8c258fb9d358c06f1920d4f834c92f10b"
    end

    on_intel do
      url "https://github.com/devplaninc/devplan-cli/releases/download/v#{version}/devplan-darwin-amd64-noautoupdate.tar.gz"
      sha256 "46c49a5540c23955bda4dd5e0d6d55f6b49dcc5a040858b87a8c61f3f760d8cb"
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
