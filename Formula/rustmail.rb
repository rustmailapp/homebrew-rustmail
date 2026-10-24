class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.10.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.10.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "ff8703533511b47aeca8fe3800d7e07320665edcc42c23a4dc2f7566ade774a7"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.10.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "45ece38974a3729c9548c6c248ed790d113fb0507e69e4273dc0a12c865f16f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.10.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c92ea7ef09e1ff02309d45da8f3e75f7307e1bee57333ead43e238ee78d79d2b"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.10.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "877a1bf1c9321a2ca7df4f18a8a226549093b3291b29793b56d343b930ccb305"
    end
  end

  def install
    bin.install "rustmail"
    (var/"rustmail").mkpath
  end

  service do
    run [opt_bin/"rustmail", "serve"]
    keep_alive true
    working_dir var/"rustmail"
    log_path var/"log/rustmail.log"
    error_log_path var/"log/rustmail.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rustmail --version")
  end
end
