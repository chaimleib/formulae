class Haveinet < Formula
  desc "Tests whether the internet is reachable"
  homepage "https://github.com/chaimleib/haveinet"
  url "https://github.com/chaimleib/haveinet/archive/0.2.2.tar.gz"
  sha256 "5dc4e3832e6b4b05c9e542ae04dc6e885347729d2e4c249f7f2523c238158521"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/haveinet -v")
  end
end
