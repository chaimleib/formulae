class Haveinet < Formula
  desc "Tests whether the internet is reachable"
  homepage "https://github.com/chaimleib/haveinet"
  url "https://github.com/chaimleib/haveinet/archive/0.3.0.tar.gz"
  sha256 "3de15c643b3879767e5d27c2e25c7dbf03d9517ec18d92674cbefd40b30a333d"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/haveinet -v")
  end
end
