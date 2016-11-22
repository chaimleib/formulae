class Repoactions < Formula
  desc "Run a script whenever you enter a git repo"
  homepage "https://github.com/chaimleib/repoactions"
  url "https://github.com/chaimleib/repoactions/archive/v0.0.4.tar.gz"
  sha256 "aad91ed5849395e2be02df37d8c30dd7d11aee9e431f069a751fed0bc69f3b07"
  option "with-rc=", "Specify where to inject login setup (default: ~/.profile)"

  def install
    args = ["--prefix=#{prefix}"]
    args << "--with-rc=#{rc}" if build.with? "rc"
    system "./configure", *args
    system "make", "install"
  end
  
  test do
    assert_match /#{version}/, shell_output("#{bin}/show_repoactions -v")
  end
end
