class ContainerCompose < Formula
  desc "Docker-Compose for Apple Container"
  homepage "https://github.com/jhoogstraat/container-compose"
  url "https://github.com/jhoogstraat/Container-Compose/archive/refs/tags/0.9.1-beta.tar.gz"
  sha256 "6d41ef5c7c88dff6c40663cd86d709c04e7645c79b1e6c2a3d7f239be32d9a5f"
  license "MIT"
  head "https://github.com/jhoogstraat/container-compose.git", branch: "main"

  depends_on xcode: ["26.0", :build]
  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/container-compose"
  end

  test do
    output = shell_output("#{bin}/container-compose down 2>&1", 1)
    assert_match "compose.yml not found at #{testpath}", output
  end
end
