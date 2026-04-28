class Swm < Formula
  desc "One CLI to search, provision, and manage cloud GPUs across 10 providers"
  homepage "https://github.com/swm-gpu/swm"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-arm64"
      sha256 "a68c656c52da4d6aa5c36fb544fde393c120ead61e9f2cbb8629fb09a72b21f7"
    end
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-amd64"
      sha256 "197644e6f123a812c240d096b84a23f0a117c3905470ba3a5cae6e75aba0919f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-linux-amd64"
      sha256 "e3d6766d04091434d85554e9219f26af7fd92b6110dd7114987b44681ccd169a"
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
