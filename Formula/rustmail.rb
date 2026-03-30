class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.2.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.1/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "abc17058ca389ffc7eeaa6add63e8bb3abc12228d45a5876f52ca03a2ea32a62"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.1/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "1e2f89040c6423f21177c6a382aa656908ba280933bc9d343e2b0bd67f4921d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.1/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bac2f279ef8509e496ee2795eee5d1b4a26c675abb193fe30035f2fd0ccf5d2"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.1/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf2323c8508b8b17d332a1313f047ed5fc9f261b85db86871a61aad4abcc12b3"
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
