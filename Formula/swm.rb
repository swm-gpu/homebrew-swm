class Swm < Formula
  desc "One CLI to search, provision, and manage cloud GPUs across 10 providers"
  homepage "https://github.com/swm-gpu/swm"
  version "0.2.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-arm64"
      sha256 "ea32e844452fc5a11fa67add1a126212b80772f1610e4e55cd483d7968563740"
    end
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-amd64"
      sha256 "063b3b9bc0e409bfeb75ebfb30e188f3c1da957f6a1aebee63d200676b308b6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-linux-amd64"
      sha256 "69c17bdeaf0e394e6b9e41d1ab0c5e7d1d2aa9be13693177d34c4c028a912766"
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
