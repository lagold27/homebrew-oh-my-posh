class OhMyPosh < Formula
  desc "Prompt theme engine for any shell"
  homepage "https://ohmyposh.dev"
  url "https://github.com/JanDeDobbeleer/oh-my-posh/archive/v3.162.1.tar.gz"
  sha256 "eb5b50f01b888f137b4703e289f3d88d2091bedbfed6d43686b87b779c7b2d4b"
  license "GPL-3.0-only"
  version "3.162.1"

  depends_on "go@1.16" => :build

  def install
    Dir.chdir("src") do
      system("go build -o=oh-my-posh -ldflags=\"-X \'main.Version=3.162.1\'\"")
      bin.install "oh-my-posh"
    end
    mv "themes", prefix
  end

  def caveats
    <<~EOS
      Thanks for installing Oh my Posh.
      Have a look at https://ohmyposh.dev/docs/installation for detailed instructions for your shell.
      Sample themes can be found at $(brew --prefix oh-my-posh)/themes.

      If you're enjoying Oh my Posh, feel free to donate or become a sponsor.
      https://github.com/sponsors/JanDeDobbeleer

      Don't have anything to spare but still consider doing something?
      Nominating me as a Github Star can help as well!
      https://stars.github.com/nominate/
    EOS
  end

  test do
    system "#{bin}/oh-my-posh", "--help"
  end
end

