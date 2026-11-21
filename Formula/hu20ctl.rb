class Hu20ctl < Formula
  desc "Operational CLI and capture daemon for SecuGen Hamster Pro 20 (HU20) scanners"
  homepage "https://github.com/faeliaso/hu20ctl"
  version "0.4.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "23b0ee0b3ab04a0ab7fd521574bfe430eec199c8ce77ce53cbfa0084aaec762e"
  else
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "dc3fcd3ad0d38fd9878ffea43d386e2fb9470f14d1b74f36b0d7d9b5f4689003"
  end

  depends_on "libusb"

  def install
    bin.install "hu20ctl"
    man1.install "man/hu20ctl.1" if (buildpath/"man/hu20ctl.1").exist?
  end

  test do
    system "#{bin}/hu20ctl", "--version"
  end
end
