class Fs80hctl < Formula
  desc "Technical control CLI for Futronic FS80/FS80H fingerprint scanners"
  homepage "https://github.com/faeliaso/fs80hctl"
  version "0.4.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "f46e894e93eb5d97ef85328011e57270ee3160acac194d219c75a3933eda2f15"
  else
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "38c23580b45b51732bd7fb09898918aa3d519b64ac37f32ea1e45cad7096df58"
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
