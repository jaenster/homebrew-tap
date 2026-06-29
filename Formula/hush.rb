class Hush < Formula
  desc "macOS-local secrets daemon — ssh-agent, but for environment variables"
  homepage "https://hush.typeguru.nl"
  version "0.1.0"
  license "MIT"

  # Apple Silicon only for now; Intel binaries land in the next release.
  depends_on arch: :arm64

  on_macos do
    url "https://github.com/jaenster/hush/releases/download/v#{version}/hush-v#{version}-aarch64-macos.tar.gz"
    sha256 "51adaf98e9dd6e2d17d92fa7407f9c275b9cdb66953e34c84551dbf05f5b007f"
  end

  def install
    bin.install "hush", "hushd"
    bin.install "hush-bar" if File.exist?("hush-bar")
  end

  service do
    run [opt_bin/"hushd"]
    keep_alive true
    log_path var/"log/hushd.log"
    error_log_path var/"log/hushd.log"
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --help 2>&1", 0)
  end
end
