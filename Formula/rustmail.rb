class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.10.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.10.1/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "7cbad47eb2002c05855ca7ef9a8771835ec5879579cd6438df47e9ef50cd5533"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.10.1/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "acb618d236ef052da64af1a40c8e76a1dc99164d195c2e50bedd78c154c9c74d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.10.1/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8931f627bc7725052f63b6e8a6286258211333defe892d0d9bf8991b0435c8df"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.10.1/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "053c35c7a5e3ee5e23f613ff0bf4d7e3159d681f78b6f6b8e748df0fc3fef2cd"
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
