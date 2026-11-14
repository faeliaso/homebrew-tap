class Fs80hctl < Formula
  desc "Technical control CLI for Futronic FS80/FS80H fingerprint scanners"
  homepage "https://github.com/faeliaso/fs80hctl"
  version "0.3.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "0cbf709cc3d33819fdb25726d4e75f71c55d4b7a1fcf9c70bd36c45ba8140328"
  else
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "47cb1d23d0345a6e8a671369c7e8c7e7fb2317bb3eec0f40431b652198b6e5d2"
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
