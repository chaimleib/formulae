class Haveinet < Formula
  desc "Tests whether the internet is reachable"
  homepage "https://github.com/chaimleib/haveinet"
  url "https://github.com/chaimleib/haveinet/archive/0.1.0.tar.gz"
  sha256 "ba7062b0fc224ddda2844c138fa631883d5ada782d6886e1f61815a5b2806d02"

  def install
    system "make", "install"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/haveinet -v")
  end
end
