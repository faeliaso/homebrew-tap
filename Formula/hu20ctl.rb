class Hu20ctl < Formula
  desc "Operational CLI and capture daemon for SecuGen Hamster Pro 20 (HU20) scanners"
  homepage "https://github.com/faeliaso/hu20ctl"
  version "0.3.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "e1b0a51c1181373b5f50aef6d528469028c24c5aa2a6e543c1dd8f8797ba7ed2"
  else
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "91028b48d60ab275da356014a35421ee8a274aaedac6ff6aa757a27601bfbeb3"
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
