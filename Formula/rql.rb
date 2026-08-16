# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.48"

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
      url "https://downloads.repoql.ai/1.6.48/osx-arm64/rql-1.6.48-osx-arm64.tar.gz"
      sha256 "b2643eb413e38b9492d2130cef14a26c00772826a257db6b934c4661b30c9f9f"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.48/osx-x64/rql-1.6.48-osx-x64.tar.gz"
      sha256 "8a11d594dcbc3060d52edfd7530ebcfeb687b7c2eaa299947162ef9baf4bfde8"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.48/linux-arm64/rql-1.6.48-linux-arm64.tar.gz"
      sha256 "c60b2e3d22fd5148ca2b4bc98e05d263fc3244fd880fa1f3ab35a5784cd3d535"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.48/linux-x64/rql-1.6.48-linux-x64.tar.gz"
      sha256 "55e7dc23359cb84749fda06ee71aac03c2f1e2e440e9916b7e16ec068f66ac9f"
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
