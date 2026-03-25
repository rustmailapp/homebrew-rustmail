class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.1.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.1/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "827fece27d8b9b54f253e11841f494eea0ca598e3181cdd2e705c5bdd1d86951"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.1/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "b06a175c54f2ced91104183577d7077f4bd7ea8669801b1a2d2d5e448764310b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.1/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "198442c9f0b8e95ceee39c39b1c27b5646f745cd229a9453984f54b79b50d208"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.1/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95ff8043936b2b4f814573c18e14b331d319a9dfe6269e1c0469cb6a8bdbd3a0"
    end
  end

  def install
    bin.install "rustmail"
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
