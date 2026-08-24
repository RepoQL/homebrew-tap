# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.52"

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
      url "https://downloads.repoql.ai/1.6.52/osx-arm64/rql-1.6.52-osx-arm64.tar.gz"
      sha256 "5f09c753db2b4d8093c96e24476187b43872353e42a71be187a4e01e5df0de38"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.52/osx-x64/rql-1.6.52-osx-x64.tar.gz"
      sha256 "6924e7dd96d538197ccd85f9a00235e70f6694b601d9c3a3a95a59b325a454ce"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.52/linux-arm64/rql-1.6.52-linux-arm64.tar.gz"
      sha256 "1b906bf4b7472cd802b15cc07ce10e935f7d6bbf430f7076e9bf2aea0d0d0c34"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.52/linux-x64/rql-1.6.52-linux-x64.tar.gz"
      sha256 "ddd73a71730bbc7d9f86a9b22b4e1fa17c19708ec38d7c88c40e0e68aafaf7ea"
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
