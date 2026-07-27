class Swm < Formula
  desc "One CLI to search, provision, and manage cloud GPUs across 10 providers"
  homepage "https://github.com/swm-gpu/swm"
  version "0.2.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-arm64"
      sha256 "3113382b4a05777e2f090ca1ae31822cf42ecd4028b0fadcc0e27d2bab95e4fa"
    end
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-amd64"
      sha256 "941a51697c7337314bbf8d966a1865bdc0ca6395f0d6b5f102617804b8b4cc30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-linux-amd64"
      sha256 "3ae6ed13d3f28e6d0864a6fe0de4cabc724c903b7b61296762f978eb83e37d29"
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
