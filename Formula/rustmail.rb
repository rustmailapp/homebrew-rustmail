class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.7.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.7.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "cf77a384381c0114a620163cac41dd531849af5dbf6ef5332ab9079fc8039dd7"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.7.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "654b3e0225e76379e5374e50f0dece9845293700468fb52475c323b407922950"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.7.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0adf28712f0f086c38f67735cec68ce43df6cb6f986e7cb1c0faf5558da930aa"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.7.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a7e8c4a1d552d04e5ee3673d227b651f6bddea952e6d33098c61e8350026a37"
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
