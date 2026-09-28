# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.9"

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
      url "https://downloads.repoql.ai/1.7.9/osx-arm64/rql-1.7.9-osx-arm64.tar.gz"
      sha256 "e008e410a01064328879989a7441a653113e4950266ae9ec0313dd72f7801443"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.9/osx-x64/rql-1.7.9-osx-x64.tar.gz"
      sha256 "c5310dee869655c08121c2da0b3fc10f91ac8c9f7fbe002262bb7fabfc5fe66e"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.9/linux-arm64/rql-1.7.9-linux-arm64.tar.gz"
      sha256 "45839f41db35920618755c5d05b8e060148e2c95c159e3df5f4698f1558d62af"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.9/linux-x64/rql-1.7.9-linux-x64.tar.gz"
      sha256 "c5cfeb1721f5c9f63899a51b6e3248a33c575af868a7a89557fd39d41edadf44"
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
