class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.6.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.6.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "c6ecf52856bcd3297a62dcad4fbf0b373046aa977d247ad103e76a4269a75186"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.6.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "63026992670e829bd0516ed2ee05dd4412db5f20dfd2a78d633039844bf3e860"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.6.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "617d606214bb8474709f7db415de3feab5c202350020a39a0e738e2ea5332f3b"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.6.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5847c54840914aa967ac4e9882f4d2c625887eaf1915b439a60260d578ace59e"
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
