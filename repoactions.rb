class Repoactions < Formula
  desc "Run a script whenever you enter a git repo"
  homepage "https://github.com/chaimleib/repoactions"
  url "https://github.com/chaimleib/repoactions/archive/v0.0.6.tar.gz"
  sha256 "e8fa0507c3548df8d3b415d4ce1cef158e7e7c97b5a1caae10b250c675929376"
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
