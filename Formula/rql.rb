# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.56"

  livecheck do
    # FormulaAudit/LivecheckUrlSymbol misfires here: it treats the first `url`
    # call in the body — this one — as the stable url and suggests `url :stable`
    # against itself. The real stable urls live in the on_* blocks below and are
    # versioned, so they cannot drive livecheck. Audit waives that one cop via
    # --except-cops (inline disables are rejected by `brew audit`).
    url "https://downloads.repoql.ai/latest/version.txt"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://downloads.repoql.ai/1.6.56/osx-arm64/rql-1.6.56-osx-arm64.tar.gz"
      sha256 "7eb7b2ed01dbf7e2a7d4ee12f1cbb5323bd198fe8d873afa9ec37e5692074052"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.56/osx-x64/rql-1.6.56-osx-x64.tar.gz"
      sha256 "94a6786ec9005fda17d159946d04fc97531786f38b96ba777a503199ee9c4a54"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.56/linux-arm64/rql-1.6.56-linux-arm64.tar.gz"
      sha256 "ddf65bf3e8ab3b3109638f859b7cec8b34f1c089ff1bda52dd270c1ce6a9c1a7"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.56/linux-x64/rql-1.6.56-linux-x64.tar.gz"
      sha256 "395610d60eed7552e82064f36bd1404d483b4c67da9a7058d7b24fe626297af9"
    end
  end

  def install
    bin.install "rql"
  end

  def caveats
    <<~EOS
      Run `rql install` to set up agent integrations.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rql --version")
  end
end
