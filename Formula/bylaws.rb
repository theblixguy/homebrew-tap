class Bylaws < Formula
  desc "Architectural linter for Swift projects using Bylaws.swift rules"
  homepage "https://github.com/theblixguy/swift-bylaws"
  url "https://github.com/theblixguy/swift-bylaws/releases/download/v0.1.0/bylaws.artifactbundle.zip"
  version "0.1.0"
  sha256 "bdd51bb7c08d7356459aaf5869d0933ca1511a3ba80deffc4e64f493f732db28"
  license "MIT"

  on_linux do
    depends_on arch: :x86_64
  end

  on_macos do
    depends_on macos: :sonoma
  end

  def install
    platform = OS.mac? ? "macos" : "linux"
    bin.install "#{platform}/bin/bylaws"
    bin.install "#{platform}/bin/bylaws-lsp"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/bylaws --version").strip
    assert_equal version.to_s,
                 shell_output("#{bin}/bylaws-lsp --version").strip
    system bin/"bylaws", "init"
    assert_match "let app = Codebase", (testpath/"Bylaws.swift").read
  end
end
