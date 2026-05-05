class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.3.2"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.2/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "eb099db03f19f3fa621a60ab489030b969d8a180cc1fe7006bf80a85513ea349"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.2/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "1e4c4649607aabde92f4634f48ca862993473708a63b65a833c9985d0f747726"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.2/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1b9432c847a852baa8025cd72fa026f1bf0b014340594406861c836d7b3a257"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.2/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e50f1deda3faf2a60603d3d048947fc67be23fffce28359e7181e5a289c0bc81"
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
