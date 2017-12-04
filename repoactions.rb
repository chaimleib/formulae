class Repoactions < Formula
  desc "Run a script whenever you enter a git repo"
  homepage "https://github.com/chaimleib/repoactions"
  url "https://github.com/chaimleib/repoactions/archive/v0.1.0.tar.gz"
  sha256 "00c9bfcd06c014751ed6921949e859e792d196ad867dc0db7606410858d39e26"

  def install
    # blank --with-rc to prevent the installer from trying to modify forbidden
    # files outside the formula dir
    args = ["--prefix=#{prefix}", "--with-rc="]
    system "./configure", *args
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    Some additional setup is required to enable repoactions.

    ## bash ##
    Add the following to the end of ~/.bashrc, then start a new shell session:

        PROMPT_COMMAND='eval "\$(repoactions -e)";'"\$PROMPT_COMMAND"
        export PROMPT_COMMAND

    ## zsh ##
    Add the following to the end of ~/.zshrc, then start a new shell session:

        precmd() { source <(repoactions -e) }

  EOS
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/repoactions -v")
  end
end
