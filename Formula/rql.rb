# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.4"

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
      url "https://downloads.repoql.ai/1.7.4/osx-arm64/rql-1.7.4-osx-arm64.tar.gz"
      sha256 "95915b757831f1bfbdd1b164d23b4f413d5af22d0ba53f3380053f72fe03be4c"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.4/osx-x64/rql-1.7.4-osx-x64.tar.gz"
      sha256 "7225d2a0c1f190f2818f6844bb7d9aa9349f122e6c682d217023b21281d3743d"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.4/linux-arm64/rql-1.7.4-linux-arm64.tar.gz"
      sha256 "661baea5087888321740b1857718b55aec92efa79c63b67e3144867d3169debd"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.4/linux-x64/rql-1.7.4-linux-x64.tar.gz"
      sha256 "b5176cba52a7ed53a80d4537065820ff1d92c76294a47eb585eddeac24d7768e"
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
