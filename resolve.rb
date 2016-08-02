class Resolve < Formula
  desc "Simplify relative and absolute paths"
  homepage "https://github.com/chaimleib/resolve"
  url "https://github.com/chaimleib/resolve/archive/0.1.2.tar.gz"
  sha256 "b73d47e93da05c592ad741c4f7808b697517887d05d59d8987dc059d7217fee0"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/resolve")
  end
end
