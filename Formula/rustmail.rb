class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.3.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "4fef2f86eb813ee64a22f391f942d6e9ad1127a108d832f08090a012167dd041"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "dc90fb5416692b3dd6238ce1b323bae5722442880c6d61faf341b3ba5b9c4457"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c974eb8ead99b8a393172d3736ae8d1b1998f1d7e83843fb8ab400ab7af77296"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c34eda2143aeacfdb29ba66659d4c7ba0960421c68024ef4623be0faab496ef"
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
