# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.55"

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
      url "https://downloads.repoql.ai/1.6.55/osx-arm64/rql-1.6.55-osx-arm64.tar.gz"
      sha256 "bcfcf3b60d9b32ad7111f708fe66afd79f42a5a93bc3b88f20102b5e61a6ba60"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.55/osx-x64/rql-1.6.55-osx-x64.tar.gz"
      sha256 "1b2f91004fd285afbe73bbfc097b35347bbb7bb22d6d089c62d73d6e2e7eb243"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.55/linux-arm64/rql-1.6.55-linux-arm64.tar.gz"
      sha256 "db516439bca5e34f992a61e283219f573cd063ef72e370b13f462ca164acb8a1"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.55/linux-x64/rql-1.6.55-linux-x64.tar.gz"
      sha256 "a08bf8bdcc56290bc21b11033c6e8f358bd9a829357ca9072b258af41ee09296"
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
