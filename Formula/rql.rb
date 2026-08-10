# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.45"

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
      url "https://downloads.repoql.ai/1.6.45/osx-arm64/rql-1.6.45-osx-arm64.tar.gz"
      sha256 "07a2d859b9a4fa103a2a21a60e559a2c3b7dd0a7ec933812523b37ecda780cb7"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.45/osx-x64/rql-1.6.45-osx-x64.tar.gz"
      sha256 "7f304070ab769286fe85dbebcfa512ffd0455768b64ddb006e13a797814bcd2f"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.45/linux-arm64/rql-1.6.45-linux-arm64.tar.gz"
      sha256 "4b1fd3802d414548ec053ecbdd3b7f19e58088d20c294182159edf904028264c"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.45/linux-x64/rql-1.6.45-linux-x64.tar.gz"
      sha256 "3658e4310ef585827fde1ced9680be542b419def41449ff67c1c0785c6c75393"
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
