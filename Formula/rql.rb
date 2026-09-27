# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.8"

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
      url "https://downloads.repoql.ai/1.7.8/osx-arm64/rql-1.7.8-osx-arm64.tar.gz"
      sha256 "990ad0de99e318cab5e02f7b465f4917abe9c5a1c288ef17e47b49d3281eaa88"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.8/osx-x64/rql-1.7.8-osx-x64.tar.gz"
      sha256 "1556009dc715ca7f63449ddd32880b80ac1bb3370fac7c9ae05630ee78ba7c80"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.8/linux-arm64/rql-1.7.8-linux-arm64.tar.gz"
      sha256 "bcf16cca1d045117971c47dc5ed11efa03902944ae9f3c3a97c7810ac18bbb5e"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.8/linux-x64/rql-1.7.8-linux-x64.tar.gz"
      sha256 "538deb1e112f6d6e06880725739575ce7688ce63a9c5ad62adcb1ac10e29572f"
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
