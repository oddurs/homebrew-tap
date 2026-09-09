# Homebrew formula for quarry.
#
# Lives in a tap: https://github.com/oddurs/homebrew-tap
#   brew install oddurs/tap/quarry
#
# Checksums come from the SHA256SUMS published with each release.
class Quarry < Formula
  desc "See every server running on this machine, and whose project it came from"
  homepage "https://oddurs.github.io/quarry"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/oddurs/quarry/releases/download/v#{version}/quarry-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "989cf03a15fef8bf6dbcefb5e6bf0d8e595c819986aca4f834e4267e8114cf89"
    end
    on_intel do
      url "https://github.com/oddurs/quarry/releases/download/v#{version}/quarry-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "488dcadfc64fa9cb96ba4696b8466b754a8a23378aa6d704da82c59218f700be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/oddurs/quarry/releases/download/v#{version}/quarry-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4c4348cbe9a071979747e0a7088bd266308f0fdaa28f57aba12ab53b44fc0d9"
    end
    on_intel do
      url "https://github.com/oddurs/quarry/releases/download/v#{version}/quarry-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6e8434dc003f9776f1247cb6e029ba0059f4a974ae2ab44828ab1125539a8e9"
    end
  end

  def install
    bin.install "quarry"
  end

  test do
    assert_match "quarry #{version}", shell_output("#{bin}/quarry --version")
    # --doctor exits non-zero only when a fatal dependency is missing, which
    # cannot be asserted in a sandbox, so this just checks it runs.
    system bin/"quarry", "--help"
  end
end
