class Repoactions < Formula
  desc "Run a script whenever you enter a git repo"
  homepage "https://github.com/chaimleib/repoactions"
  url "https://github.com/chaimleib/repoactions/archive/v0.0.9.tar.gz"
  sha256 "b1453a558c6c39ed449e29aebad1c6ae52df3a4eb1235db9b1f93452a196b09d"
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
