class Hu20ctl < Formula
  desc "Operational CLI and capture daemon for SecuGen Hamster Pro 20 (HU20) scanners"
  homepage "https://github.com/faeliaso/hu20ctl"
  version "0.5.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "7fe1436654769091d4fe0d05341ccc3d54352a9895603ab13dbb776421940243"
  else
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "e79de47c45c2c028d5761b04a66a7562b3ce0aebee828c5f2fdc2973b551fd60"
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
