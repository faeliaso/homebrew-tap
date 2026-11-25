class Hu20ctl < Formula
  desc "Operational CLI and capture daemon for SecuGen Hamster Pro 20 (HU20) scanners"
  homepage "https://github.com/faeliaso/hu20ctl"
  version "0.5.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "d74b0dfc4999f3bc2b5dc674b9ea37ece24050179bd06ed7cc980e10521bbade"
  else
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "8826c93245e3647aa90a49a1ba24779d6913c1c3a362be402479fdeb7697df97"
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
