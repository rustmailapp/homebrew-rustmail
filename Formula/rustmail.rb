class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.9.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.9.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "afd9f96adb5ee0dbfc57dce730331754df6ddd253119460206281259a85d751e"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.9.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "78e83a8989d5c9a499b7306031b3b32719a8ad0ffb32297a595ad663fcd31bf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.9.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5c6e7fd90e37d41592a98aab616cb959b60b2caf0d3e617e7f8735b0b4038ea"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.9.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "821971309a48419c55bfe9a58ce54940d030d19f373b1e01a4febc8e06e8c7f9"
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
