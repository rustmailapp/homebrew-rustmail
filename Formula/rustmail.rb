class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.4.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.4.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "c3a21f348c54d34a57adff16c48b27215c388750b0734cb399873a913e3ed7e9"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.4.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "ab6b7a36d0e263daf6726f5c627e57cf18d1f490d9bd9dbe0a3d723c76c51d4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.4.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "606c19a31ec2315653801625b3703ab2ee5c75c8a43bcc0dfb890f23deff6a9f"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.4.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c92789a5be020dc97ce9b8c4db053119218534c430c38f2cf1c8b85f4100f3cf"
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
