class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.2.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "673db0552e321bb23bc631fafd04ba55a32d598a663d37199747b7e3a101ce21"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "50d7ee5f5ca8cf9eb543b3a8111ffe26cae71e773cc7b8f112c956cb2e6ca7ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdfcea62d540d090e8ed4d59e46ffe1eedb29bc8db7b479f27a39e333b810428"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5bd203e15217e6cb4fb27be97986939408d63426f09aae7e0bc93f555ecc5d4"
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
