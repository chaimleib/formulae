class Repoactions < Formula
  desc "Run a script whenever you enter a git repo"
  homepage "https://github.com/chaimleib/repoactions"
  url "https://github.com/chaimleib/repoactions/archive/v0.0.10.tar.gz"
  sha256 "db389935887288ca5d57c75f0b705f73702f86fdc97d0d79f60fe1769e9c3443"
  option "with-rc=", "Specify where to inject login setup (default: ~/.profile)"

  def install
    args = ["--prefix=#{prefix}"]
    rc = ARGV.value("with-rc")
    args << "--with-rc=#{rc}" if rc
    system "./configure", *args
    system "make", "install"
  end
  
  test do
    assert_match /#{version}/, shell_output("#{bin}/show_repoactions -v")
  end
end
