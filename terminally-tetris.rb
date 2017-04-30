class TerminallyTetris < Formula
  desc "Play Tetris in the Terminal"
  homepage "https://github.com/thecardkid/terminally-tetris"
  url "https://github.com/thecardkid/terminally-tetris/archive/v1.1.0.tar.gz"
  sha256 "f1777b45233c0276dd86478cb49c27e28066a1b5750284a84554f71ed1c2e6da"

  depends_on "ncurses" => :build

  def install
    system "make"
    bin.install "build/ttetris"
    man.mkpath
    man1.install "man/ttetris.1"
  end

  test do
    output = shell_output(bin/"ttetris help")
    assert_match "Terminally-Tetris' key bindings", output

    # invalid argument
    output = shell_output(bin/"ttetris save")
    assert_match "Did not recognize argument. See man page for help.", output
  end
end
