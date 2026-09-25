class Bylaws < Formula
  desc "Architectural linter for Swift projects using Bylaws.swift rules"
  homepage "https://github.com/theblixguy/swift-bylaws"
  url "https://github.com/theblixguy/swift-bylaws/releases/download/v0.6.0/bylaws.artifactbundle.zip"
  version "0.6.0"
  sha256 "3c59b508f565e59e59cc6b7ef6820f982cf749f7c2df25f35f7f957eee04f312"
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
