class Swm < Formula
  desc "One CLI to search, provision, and manage cloud GPUs across 10 providers"
  homepage "https://github.com/swm-gpu/swm"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-arm64"
      sha256 "033bbaa6015668125e03a6df7a1dde763da7d7c0cd4a4f6fbc59d1292123dc71"
    end
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-amd64"
      sha256 "5d9892e60e7066c8ce4ac1bc8215e7c0ff8178b12ac38c6610ba7538bf4781ca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-linux-amd64"
      sha256 "3e446a359c88d3e7f46ff3fc017457b7cb5bcaa8127848c38b030bd936c172c6"
    end
  end

  def install
    binary = Dir["swm-*"].first || "swm"
    bin.install binary => "swm"
  end

  test do
    assert_match "swm, version", shell_output("#{bin}/swm --version")
  end
end
