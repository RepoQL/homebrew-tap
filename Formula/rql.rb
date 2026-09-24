# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.7"

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
      url "https://downloads.repoql.ai/1.7.7/osx-arm64/rql-1.7.7-osx-arm64.tar.gz"
      sha256 "727deded81c0987c9449d4e9ba687e38a48eef541a55577d845f1392548e1357"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.7/osx-x64/rql-1.7.7-osx-x64.tar.gz"
      sha256 "ee0fa5b69606eda11274062aaa7c14216ca8dd5420bc960574a1653df9e3ae53"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.7/linux-arm64/rql-1.7.7-linux-arm64.tar.gz"
      sha256 "7bf14ddb5d68a7d24e480c21d49d77f888ff762437b786a344f7adb13a5a5eb1"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.7/linux-x64/rql-1.7.7-linux-x64.tar.gz"
      sha256 "30a635b1f9b3565209b022c991dc0d0437a08a58c5e02d188a177d7c9a7434a5"
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
