# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.43"

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
      url "https://downloads.repoql.ai/1.6.43/osx-arm64/rql-1.6.43-osx-arm64.tar.gz"
      sha256 "8bca22a7e6f55e1804fe2e05f2e49c988b267ff426ee807f02559054bc8a9f1e"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.43/osx-x64/rql-1.6.43-osx-x64.tar.gz"
      sha256 "5d3a72f51c8468fd5fe986646cdcea8c1f5227a3076cec569fafff682d9bef0d"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.43/linux-arm64/rql-1.6.43-linux-arm64.tar.gz"
      sha256 "fecfa37c0e606f7aa1bad5e686b9268aee36a61bc96e8243730a0f68155bdf47"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.43/linux-x64/rql-1.6.43-linux-x64.tar.gz"
      sha256 "37be1480798fa61c3d5d74fcba1be1e4bb46dabc81855527e68b58a13554a9df"
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
