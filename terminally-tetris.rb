class TerminallyTetris < Formula
  desc "It's everything you could want from a 1984 Russian-made video game in the comfort of your shell"
  homepage "https://github.com/thecardkid/terminally-tetris"
  url "https://github.com/thecardkid/terminally-tetris/archive/v1.2.0.tar.gz"
  sha256 "8aa19c085736231d419fe1ef50c11be4d563df7f3f5add04a10851569144cc22"

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
