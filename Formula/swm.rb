class Swm < Formula
  desc "One CLI to search, provision, and manage cloud GPUs across 10 providers"
  homepage "https://github.com/swm-gpu/swm"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-arm64"
      sha256 "72ad12e6c7dd332c5806d4d7e1187ac9b74896563c9d2f16a2eebe054a59dc09"
    end
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-darwin-amd64"
      sha256 "b7c639c019190a5ef13e5fee36e20f7b02ddfea0543e915abe34edc44e347204"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/swm-gpu/swm/releases/download/v#{version}/swm-#{version}-linux-amd64"
      sha256 "7db2c5d49ade266b4c53c4e34f65ad05f5b709bc9459c56d2936f81faf56cd8d"
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
