class Repoactions < Formula
  desc "Run a script whenever you enter a git repo"
  homepage "https://github.com/chaimleib/repoactions"
  url "https://github.com/chaimleib/repoactions/archive/v0.0.10.tar.gz"
  sha256 "d3de6b296cd8981ed627dc058885736ea2e4b962eb9716c9408ea2d2f94445b6"
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
