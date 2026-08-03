# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.40"

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
      url "https://downloads.repoql.ai/1.6.40/osx-arm64/rql-1.6.40-osx-arm64.tar.gz"
      sha256 "ce8355dc504f91810bcebcaf9d97e4340c748ecbec170a6a7fcb3e914b7e814b"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.40/osx-x64/rql-1.6.40-osx-x64.tar.gz"
      sha256 "80c1806ab2ece59b71c3fe45858942c510e3abc1eacd32229fb0523c6d405c16"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.40/linux-arm64/rql-1.6.40-linux-arm64.tar.gz"
      sha256 "962d1b600f637dfabf89c31cd5f387018c447c22bf43711cf316b7dcc2ce15e1"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.40/linux-x64/rql-1.6.40-linux-x64.tar.gz"
      sha256 "270a1c6baf4a79f3d5381b926e10ecc168be04a16810aa4aded92e16d06f5887"
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
