class Haveinet < Formula
  desc "Tests whether the internet is reachable"
  homepage "https://github.com/chaimleib/haveinet"
  url "https://github.com/chaimleib/haveinet/archive/0.2.1.tar.gz"
  sha256 "95108dbb4f5877eb645d6791b218f5523b8fa60d06fedf5297213674a4741512"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/haveinet -v")
  end
end
