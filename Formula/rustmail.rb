class Rustmail < Formula
  desc "Self-hosted SMTP mail catcher with web UI, REST API, and CI assertions"
  homepage "https://github.com/rustmailapp/rustmail"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.0/rustmail-aarch64-apple-darwin.tar.gz"
      sha256 "d558331a9ea4e39d81a31bae5d6e0951bb7110c977140bd8cd7e0fbac4ae6a67"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.0/rustmail-x86_64-apple-darwin.tar.gz"
      sha256 "28f80490dc28c447ce6fe688cd959ff32e2ba0175ec0bd6b6c013f40437fd987"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.0/rustmail-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eedf81bbe22c4b83132462848af3d41f296caf2f4a4125b74f415c7962a8b97f"
    end
    on_intel do
      url "https://github.com/rustmailapp/rustmail/releases/download/v0.1.0/rustmail-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfb862e2784eb7738096030fdfeaca19253b613615298459296c474165f73b4e"
    end
  end

  def install
    bin.install "rustmail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rustmail --version")
  end
end
