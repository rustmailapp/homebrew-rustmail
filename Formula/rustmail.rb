class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.3.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.1/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "8d7737b758eb31536ddec25d057afc8a2143bdd2718adc39fe2bac2ccfc16472"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.1/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "89a255ba1efdc92cb8e3917358d53830bb70561a55eb8021f4b310ae647ea551"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.1/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "592c4274a72e13152d45d8d6487cc2ab500069ee28822233e65837752c6162d6"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.3.1/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "438a1c1b353604f3e73abc7d37c6e73a48ead3c2e098d95cf8a8c229042f51cb"
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
