class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.8.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.8.1/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "7bf4d299e63c9bc161acc1cf21331931964b89f784f4d9843b80aeffa116d0e3"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.8.1/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "afcff4f3717e300523fdc107a80a6633043536a9b1cf419d78cf7381b1f34659"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.8.1/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bf6bce6e150b3aafad4cbd1ec56f2b12b8bed6b0123a442e26ef19dd15e3938"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.8.1/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "682a5d9e15d20119aa6491043b7adfcad81d9ca8563987ecd2ac51940856c21f"
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
