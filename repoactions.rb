class Repoactions < Formula
  desc "Run a script whenever you enter a git repo"
  homepage "https://github.com/chaimleib/repoactions"
  url "https://github.com/chaimleib/repoactions/archive/v0.3.3.tar.gz"
  sha256 "3c59b74623aa047bf8ce96a5d0f9ca1b88d535b40d1bda7a80dfc207dbb93319"

  def install
    # blank --with-rc to prevent the installer from trying to modify forbidden
    # files outside the formula dir
    args = ["--prefix=#{prefix}", "--with-rc="]
    system "./configure", *args
    system "make", "install"
  end

  def caveats; <<~EOS
    Some additional setup is required to enable repoactions.

    ## bash ##
    Add the following to the end of ~/.bashrc, then start a new shell session:

        [[ -n "$PROMPT_COMMAND" ]] && [[ "$PROMPT_COMMAND" != *';' ]] &&
          PROMPT_COMMAND="$PROMPT_COMMAND;"
        PROMPT_COMMAND="$PROMPT_COMMAND"'eval "$(repoactions -e)"'
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
