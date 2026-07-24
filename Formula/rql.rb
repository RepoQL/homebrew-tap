# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.34"

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
      url "https://downloads.repoql.ai/1.6.34/osx-arm64/rql-1.6.34-osx-arm64.tar.gz"
      sha256 "90524a7b9ed5cd17ed04101fada03cffd0aa9fd50c330de111e286a7e754fe9a"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.34/osx-x64/rql-1.6.34-osx-x64.tar.gz"
      sha256 "2750b916ff9f9bfc6ed847e3dc2d92da9e9ef7db8a5a2bba548e5b6aba9153b3"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.34/linux-arm64/rql-1.6.34-linux-arm64.tar.gz"
      sha256 "d2dc4c9b2fc7d9dd8ffb182a35fddb99d5ab22c4000a07d17c7c917838e8f28f"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.34/linux-x64/rql-1.6.34-linux-x64.tar.gz"
      sha256 "ce13fe58a66160d98ff075390806d2b06dfa510d457477b13e74914884a2e0b5"
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
