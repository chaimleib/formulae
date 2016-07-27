class Haveinet < Formula
  desc "Tests whether the internet is reachable"
  homepage "https://github.com/chaimleib/haveinet"
  url "https://github.com/chaimleib/haveinet/archive/0.2.0.tar.gz"
  sha256 "7eb17e966fed3a65694d989e6e50a878470c9d8df6c51f46f3922126f0b03548"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/haveinet -v")
  end
end
