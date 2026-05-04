class Swm < Formula
  desc "One CLI to search, provision, and manage cloud GPUs across 10 providers"
  homepage "https://github.com/swm-gpu/swm"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-arm64"
      sha256 "b71309c8df173ca7d429b77c1c5c41d58ee667c4962bad41a53f36cc59a752d1"
    end
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-amd64"
      sha256 "2a52bc1616b1e96224689ab01a76195cb52a46fe94eaba0cdc2b31e6be6b6954"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-linux-amd64"
      sha256 "77fe3d778642b91baca30d2df2fa46de80c0278a81f96ef1d527c158ba6d1248"
    end
  end

  def install
    binary = Dir["swm-*"].first || "swm"
    bin.install binary => "swm"
    generate_completions_from_executable(bin/"swm", shells: [:bash, :zsh, :fish], shell_parameter_format: :click)
  end

  test do
    assert_match "swm, version", shell_output("#{bin}/swm --version")
  end
end
