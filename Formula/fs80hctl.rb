class Fs80hctl < Formula
  desc "Technical control CLI for Futronic FS80/FS80H fingerprint scanners"
  homepage "https://github.com/faeliaso/fs80hctl"
  version "0.2.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "55f15c943312f6208c880597e323dc447780e96d0c00f60fc0427049569aeae4"
  else
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "483a6f8e7deb6feef80508b5156b5fd62cb28b4f8b848a30e74392a317c334ce"
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
