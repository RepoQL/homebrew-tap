# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.37"

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
      url "https://downloads.repoql.ai/1.6.37/osx-arm64/rql-1.6.37-osx-arm64.tar.gz"
      sha256 "1c8f2f1f47ae445d5c28d702e0f32cda6606e4311d845f0d4c3f306312a1b755"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.37/osx-x64/rql-1.6.37-osx-x64.tar.gz"
      sha256 "7dfefd3de8ffc4104ca9681543b58993dda5d1668265c30e4306c20e850d9566"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.37/linux-arm64/rql-1.6.37-linux-arm64.tar.gz"
      sha256 "900c165aaf3c2b46558d97183688220acdcad273b2baa4591690e43b0ea30cb2"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.37/linux-x64/rql-1.6.37-linux-x64.tar.gz"
      sha256 "56e51a1e33e625f76f36a95bd10bf30854c0a254ae4d395b4866a142b20becdd"
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
