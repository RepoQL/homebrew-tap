# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.10"

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
      url "https://downloads.repoql.ai/1.7.10/osx-arm64/rql-1.7.10-osx-arm64.tar.gz"
      sha256 "a4bbbb9558ac4cb533f031cf66a77ddf7d408bf0a3d3b5ba7f806e875eca2669"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.10/osx-x64/rql-1.7.10-osx-x64.tar.gz"
      sha256 "c0a1a592c39935cf7bc2e66ff9c718eb80eab0ee0bc7b9712666afd65d1b5998"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.10/linux-arm64/rql-1.7.10-linux-arm64.tar.gz"
      sha256 "f0cd698adda8f1ec99d15783ae99e3520cb4bfc022c50ba229501b59c37c7fc9"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.10/linux-x64/rql-1.7.10-linux-x64.tar.gz"
      sha256 "27b859dcf99f7d85e8b1994622f00cd747ea5a0e3434db862d1d95019670fe57"
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
