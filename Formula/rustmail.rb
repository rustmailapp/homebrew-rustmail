class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.8.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.8.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "5d35f8c9c65c7d519164309b1307611b584a39e3442469603cad479e3e0ba94c"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.8.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "0917e974ed50b0395d45242ad3eb6675e748c5de88dd988722decd16f9b68c82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.8.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7307250b3ee36b6cdd71018821d49a506ebbcd1b1500382b7bcf53e746360d85"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.8.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58d99674478aea5910c532b0cfc68af77e3412dd4c540a3416e890a563491009"
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
