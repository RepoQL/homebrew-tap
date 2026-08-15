# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.47"

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
      url "https://downloads.repoql.ai/1.6.47/osx-arm64/rql-1.6.47-osx-arm64.tar.gz"
      sha256 "f30fce76662facbc0c8e531ffc75a2c155f02a2f67ae8eb7eb5bbd5727739fc7"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.47/osx-x64/rql-1.6.47-osx-x64.tar.gz"
      sha256 "aeff4eac6f7b936ca119f45f21beed2ffabe01e86d0847f6856e72ce4fb7be60"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.47/linux-arm64/rql-1.6.47-linux-arm64.tar.gz"
      sha256 "6e9bbed7412b929023298c2ae7cae476d63785ca92adb6aaf08c87309dfc168d"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.47/linux-x64/rql-1.6.47-linux-x64.tar.gz"
      sha256 "2115a03db18a6fe1df54a997d993d655429671c4a2d2012e09dde5e607e9d2a1"
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
