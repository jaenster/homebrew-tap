class Hush < Formula
  desc "macOS-local secrets daemon — ssh-agent, but for environment variables"
  homepage "https://hush.typeguru.nl"
  version "0.2.0"
  license "MIT"

  # Apple Silicon only for now; Intel binaries land in the next release.
  depends_on arch: :arm64

  on_macos do
    url "https://github.com/jaenster/hush/releases/download/v#{version}/hush-v#{version}-aarch64-macos.tar.gz"
    sha256 "c67ff59b59f0ef2e1e09efd1b671365df41a473779acd762d3523938d7a28190"
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
