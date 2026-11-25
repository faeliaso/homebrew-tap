class Fs80hctl < Formula
  desc "Technical control CLI for Futronic FS80/FS80H fingerprint scanners"
  homepage "https://github.com/faeliaso/fs80hctl"
  version "0.5.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-aarch64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Apple Silicon release asset.
    sha256 "0cc17909b731cd8cb24e3ad2e58049020f996b35de9924b6b7460bfaa0c6546d"
  else
    url "https://github.com/faeliaso/fs80hctl/releases/download/v#{version}/fs80hctl-v#{version}-x86_64-apple-darwin.tar.gz"
    # Replace with the SHA-256 of the Intel release asset.
    sha256 "b6223f0c22cf33691db1c1b3de6075fe8dbc666398667dc73538708043f38298"
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
