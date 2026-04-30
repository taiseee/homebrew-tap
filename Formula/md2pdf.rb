class Md2pdf < Formula
  desc "Markdown to PDF converter (pandoc + lualatex via Docker)"
  homepage "https://github.com/taiseee/md2pdf"
  url "https://github.com/taiseee/md2pdf/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2ad96b6baf277458a6a5bc251c265a2e26456cfb7e7fdfe1dcfb9a4e9291f5de"
  license "MIT"

  def install
    bin.install "bin/md2pdf"
    pkgshare.install "share/md2pdf/ensure-image.sh"
    (pkgshare/"docker").install "share/md2pdf/docker/Dockerfile"
  end

  def caveats
    <<~EOS
      md2pdf requires Docker Desktop to be installed and running.
      The first run will build the pandoc-ja:latest Docker image (takes a few minutes).

      Install Docker Desktop: https://www.docker.com/products/docker-desktop/
    EOS
  end

  test do
    assert_match "md2pdf v", shell_output("#{bin}/md2pdf --version")
    assert_match "Usage", shell_output("#{bin}/md2pdf --help")
  end
end
