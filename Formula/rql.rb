# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.17"

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
      url "https://downloads.repoql.ai/1.7.17/osx-arm64/rql-1.7.17-osx-arm64.tar.gz"
      sha256 "64138e59549920331c89ca56c88588076bddfb0b038cafb846ecb89293f0cc5d"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.17/osx-x64/rql-1.7.17-osx-x64.tar.gz"
      sha256 "c24e5f841c031fa9bbdc7a1bbc6766f28ce426b9828b82371a6d3ca568a24508"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.17/linux-arm64/rql-1.7.17-linux-arm64.tar.gz"
      sha256 "6efcd235ff148f6645e5b2f8e5f752e96a51bc285033faa3c6725c7a825e46dd"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.17/linux-x64/rql-1.7.17-linux-x64.tar.gz"
      sha256 "c99350e542eecbd1de8e118c934c76c19bef993f065901421b2b76473a9fc3bf"
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
