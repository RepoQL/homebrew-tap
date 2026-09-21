# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.6"

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
      url "https://downloads.repoql.ai/1.7.6/osx-arm64/rql-1.7.6-osx-arm64.tar.gz"
      sha256 "5717c8eedc15a219ccce58b2715db78c30cb4dbfb5fb909f3a7edb99d7b00b7d"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.6/osx-x64/rql-1.7.6-osx-x64.tar.gz"
      sha256 "c6bf43757aff4d51ff7c8494d4c1bc145f6a132e070f6b1c649d22983d611ecd"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.6/linux-arm64/rql-1.7.6-linux-arm64.tar.gz"
      sha256 "69d2fa4247c902fbcf0033a279e3b2132b9681456f16db3e4b2b6796dd38b71c"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.6/linux-x64/rql-1.7.6-linux-x64.tar.gz"
      sha256 "d8c3406e416651745407a7dcaf112123ffd500911f81fe8385ad968cba8703ea"
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
