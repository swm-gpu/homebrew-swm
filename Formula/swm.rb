class Swm < Formula
  desc "One CLI to search, provision, and manage cloud GPUs across 10 providers"
  homepage "https://github.com/swm-gpu/swm"
  version "0.2.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-arm64"
      sha256 "efdac77ec10355c11df873f07ac22a8061ef2f113cf554ed31fcfd74430390b8"
    end
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-amd64"
      sha256 "9f5c3197801067fda18af614fd2a5416d9757a316ac1e7524dcb4c59ad1be183"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-linux-amd64"
      sha256 "fd3af478f87cbd146676534cfba472d4d9903a4e8cc0ce64b224e1fafad0bfa3"
    end
  end

  def install
    binary = Dir["swm-*"].first || "swm"
    bin.install binary => "swm"
    chmod 0555, bin/"swm"
    generate_completions_from_executable(bin/"swm", shells: [:bash, :zsh, :fish], shell_parameter_format: :click)
  end

  test do
    assert_match "swm, version", shell_output("#{bin}/swm --version")
  end
end
