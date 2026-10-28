# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.18"

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
      url "https://downloads.repoql.ai/1.7.18/osx-arm64/rql-1.7.18-osx-arm64.tar.gz"
      sha256 "de1a6e3cd437529b83f1f521763c4c3b04ff8476ad579961f1e447bbd625b1c5"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.18/osx-x64/rql-1.7.18-osx-x64.tar.gz"
      sha256 "670037badf0b58b58fef2126eeb70c4a4a3d122de854107192c53f23dd58c9ef"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.18/linux-arm64/rql-1.7.18-linux-arm64.tar.gz"
      sha256 "3f7e6227ac59d2403658862da58577579b9809f6a318a03b99992c16431486c1"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.18/linux-x64/rql-1.7.18-linux-x64.tar.gz"
      sha256 "f77c23bf28c0de2adbd648cd1f4cb218e072815a0c9522555d8b32c953e321cf"
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
