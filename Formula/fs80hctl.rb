class Fs80hctl < Formula
  desc "Technical control CLI for Futronic FS80/FS80H fingerprint scanners"
  homepage "https://github.com/faeliaso/fs80hctl"
  version "0.1.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "fca95f7894fc517febc866ecd1a941c20f4786734ed8bb8131bb330d8daadfbe"
  else
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "6e24e4ec05f8e8f711eebf28bf7ad2f1d57f00e15f36d204d44c9cd0746b105c"
  end

  depends_on "libusb"

  def install
    bin.install "fs80hctl"
    man1.install "man/fs80hctl.1" if (buildpath/"man/fs80hctl.1").exist?
  end

  test do
    system "#{bin}/fs80hctl", "--version"
  end
end
