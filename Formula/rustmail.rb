class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v#{version}/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v#{version}/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v#{version}/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v#{version}/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "rustmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rustmail --version")
  end
end
