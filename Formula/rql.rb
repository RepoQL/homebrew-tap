# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.33"

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
      url "https://downloads.repoql.ai/1.6.33/osx-arm64/rql-1.6.33-osx-arm64.tar.gz"
      sha256 "5fb7ea1ac9876945479c98975cfe9e90663b0effb94a8fd5e0148070974de5ec"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.33/osx-x64/rql-1.6.33-osx-x64.tar.gz"
      sha256 "7219b622d36772a972cb81b3d83ea5de74daeec1d5ba999afbf534c740ba87e5"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.33/linux-arm64/rql-1.6.33-linux-arm64.tar.gz"
      sha256 "c78b03dcbcb546e6a9b248f1d4f5d884012c48a811b88f3766f0d36055258a41"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.33/linux-x64/rql-1.6.33-linux-x64.tar.gz"
      sha256 "6c784abd35320c96c0d42767d029f3845cde1befe593c98f96e38e732eeb2346"
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
