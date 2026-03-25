class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.1.2"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.2/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "9d29d0312a2d89e35b29f76ead7fde0fbbb934e4b132068a47f5329929d04c81"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.2/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "c58eb04e78829d25405e14cb5897a9bf478297d488c71e878982cf8dcf3b3292"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.2/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc813033b114c18c16e73a148d4d4d3c7c024d6c924d9d0acf132ea0aee338b6"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.2/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4184bf22cede1e534774a4906d26c2ba4f2959ba09d5ed1a0a7d3e2572f6444f"
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
