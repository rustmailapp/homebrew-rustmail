class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.5.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.5.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "2be69a3cb2795fc991e6cab31ef857f37994f946341cbf675d338462ac83f54f"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.5.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "16a93745d2aaf70873e26f6ec3f6da2d72ecf181f356b42611d97665c2abd5a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.5.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "113d863484a751ac6846970ee10dcd5640e125a1e8d15f59e453e9007628d875"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.5.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3aed9708f863eb21ac289edb86633d9700e774cf87f28bf219e0b3f6248cc42c"
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
