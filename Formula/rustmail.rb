class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.2.2"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.2/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "7f5a4f87e6297595c7e1bc9ff50130fb136444a63c8db30adb78578b43463306"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.2/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "ce49bdc89cdea71af645bd8e000279a83afb2aa86be01a41c23a61a0714bd745"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.2/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66e2cd0c6f65b927b320c1f33aa506779266c494c21ffe507c0963ac2b3083a2"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.2.2/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bdcdd51f798a8720ea66da4a0086953a8d2cb9abd0e1ea978083586d395fa47"
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
