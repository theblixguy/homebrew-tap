class Bylaws < Formula
  desc "Architectural linter for Swift projects using Bylaws.swift rules"
  homepage "https://github.com/theblixguy/swift-bylaws"
  url "https://github.com/theblixguy/swift-bylaws/releases/download/v0.1.1/bylaws.artifactbundle.zip"
  version "0.1.1"
  sha256 "3a2bab905f41e07eadfa06167e48018cbcc3b92b43227484338ab323cd97beac"
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
