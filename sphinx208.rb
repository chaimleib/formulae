require "formula"

class Sphinx208 < Formula
  homepage "http://www.sphinxsearch.com"
  url "http://sphinxsearch.com/files/sphinx-2.0.8-release.tar.gz"
  sha256 "bd699bf34635558e4d9d4d8bdcf5fcdd9c2e8f6c614824bec793b0010fa6cda3"

  option "mysql", "Force compiling against MySQL"
  option "pgsql", "Force compiling against PostgreSQL"

  depends_on :mysql if build.include? "mysql"
  depends_on :postgresql if build.include? "pgsql"

  conflicts_with "sphinx"

  def install
    args = %W[--prefix=#{prefix}
              --disable-dependency-tracking
              --localstatedir=#{var}]

    %w[mysql pgsql].each do |db|
      if build.include? db
        args << "--with-#{db}"
      else
        args << "--without-#{db}"
      end
    end

    system "./configure", *args
    system "make install"
  end

  def caveats; <<-EOS.undent
    Sphinx depends on either MySQL or PostreSQL as a datasource.

    You can install these with Homebrew with:
      brew install mysql
        For MySQL server.

      brew install mysql-connector-c
        For MySQL client libraries only.

      brew install postgresql
        For PostgreSQL server.

    We don't install these for you when you install this formula, as
    we don't know which datasource you intend to use.
    EOS
  end
end
