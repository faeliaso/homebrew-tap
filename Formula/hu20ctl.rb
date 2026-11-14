class Hu20ctl < Formula
  desc "Operational CLI and capture daemon for SecuGen Hamster Pro 20 (HU20) scanners"
  homepage "https://github.com/faeliaso/hu20ctl"
  version "0.2.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "9c2225b8e8e2b2b8841054e46b6c633faf85d060b82889f5e9b04bbca45dab4b"
  else
    url "https://github.com/faeliaso/hu20ctl/releases/download/v#{version}/hu20ctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "3af10857035bcc92e8edf8a7f23bf471c9d066ab63a056a87cdb924995c206bc"
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
