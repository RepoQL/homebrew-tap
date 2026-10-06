# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.12"

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
      url "https://downloads.repoql.ai/1.7.12/osx-arm64/rql-1.7.12-osx-arm64.tar.gz"
      sha256 "e9d90296fb931321b45a24cb1c0d2e3f3d3e97218f63720bbcd1b40b324bc11b"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.12/osx-x64/rql-1.7.12-osx-x64.tar.gz"
      sha256 "1b859c28950191d245c48093e9bcb9ef78a5a2b2b8598890c006fe6765162c07"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.12/linux-arm64/rql-1.7.12-linux-arm64.tar.gz"
      sha256 "0d33713c61c165f7bc38a6baa235503dc7cffc1497584c47432bf4c0e33774c4"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.12/linux-x64/rql-1.7.12-linux-x64.tar.gz"
      sha256 "2f211b777ca37d1d73128c6ccfa6e93a3c8b68d0ea47b8afd7ede8d0389871e5"
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
