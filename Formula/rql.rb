# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.21"

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
      url "https://downloads.repoql.ai/1.7.21/osx-arm64/rql-1.7.21-osx-arm64.tar.gz"
      sha256 "7ac32cd439692ef9a40922ca80e9bde26e8130d76ae335d8957b5b27c5205a29"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.21/osx-x64/rql-1.7.21-osx-x64.tar.gz"
      sha256 "70dfdbb000a1ca996c20bc4ef02bd5a189c103efdeb3ebe05f88230dcc858309"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.21/linux-arm64/rql-1.7.21-linux-arm64.tar.gz"
      sha256 "704598c3cf1a95a1fc664a7854d54a72a3811e85527aec3c735cbc854e1592b0"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.21/linux-x64/rql-1.7.21-linux-x64.tar.gz"
      sha256 "ee100fae4eb7e0b6de66780477c15d2ec9c4f934f0fa773bed9d9ce4c139841f"
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
