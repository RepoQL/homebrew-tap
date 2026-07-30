# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.39"

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
      url "https://downloads.repoql.ai/1.6.39/osx-arm64/rql-1.6.39-osx-arm64.tar.gz"
      sha256 "240ddf3e292b746efb357d3e3253a1a1f7d58ea6cc57336a554e90cc1a8d846d"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.39/osx-x64/rql-1.6.39-osx-x64.tar.gz"
      sha256 "de98b97002fb813a786bfce653fed23073cf20bad9eb992b6c3f347e214f7f68"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.39/linux-arm64/rql-1.6.39-linux-arm64.tar.gz"
      sha256 "b021185207094b90b7d0d4bc312437f15abc20487686941fb886e8fa1afad4ac"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.39/linux-x64/rql-1.6.39-linux-x64.tar.gz"
      sha256 "e87a79009e6add39ef18cc7c35f71aa600957e6a5f260ff63a0c0adbc830bf4d"
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
