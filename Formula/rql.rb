# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.53"

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
      url "https://downloads.repoql.ai/1.6.53/osx-arm64/rql-1.6.53-osx-arm64.tar.gz"
      sha256 "6d3c26b785497dfbd3bb7ea04541d46c5625ee7366b6613fc05fe2d9edcc47ea"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.53/osx-x64/rql-1.6.53-osx-x64.tar.gz"
      sha256 "b3739eb370672817ce0c31b0c1077000647fb49e00afee1c554b9fd9ce88ff95"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.53/linux-arm64/rql-1.6.53-linux-arm64.tar.gz"
      sha256 "77dc805e3ddc1575f13c4a8e9eb1aeabcc63f00d59c03875b8f7e069611383f3"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.53/linux-x64/rql-1.6.53-linux-x64.tar.gz"
      sha256 "bd6d9a3a3d65e2cccb6e5adf1ee698c626b8fc06fef4662337c0ebb92fea0eb3"
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
