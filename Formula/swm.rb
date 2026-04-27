class Swm < Formula
  desc "One CLI to search, provision, and manage cloud GPUs across 10 providers"
  homepage "https://github.com/swm-gpu/swm"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-arm64"
      sha256 "29e2fae2685bd178ede1e8563cadf920688880d10f2263954ec9962da158b075"
    end
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-amd64"
      sha256 "6cecee8d30da7e97651ca0116ad293e6db329302033f55f1c3c9227943366215"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-linux-amd64"
      sha256 "0529d661eb1c581d9d03aba078679ea417a92064e0231b23368c60b76f8748ce"
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
