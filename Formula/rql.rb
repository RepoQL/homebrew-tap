# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.51"

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
      url "https://downloads.repoql.ai/1.6.51/osx-arm64/rql-1.6.51-osx-arm64.tar.gz"
      sha256 "d4b5b4f7b4ea620029104ae38eff7ca565a80d8e3dec3c2a579cecbbb35c293e"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.51/osx-x64/rql-1.6.51-osx-x64.tar.gz"
      sha256 "5c77e19680e57ca98a651e6c40f11e2056852cc0fa4f5e50ed234e84a31211b1"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.51/linux-arm64/rql-1.6.51-linux-arm64.tar.gz"
      sha256 "93cf90e28953285ef5d087ab8f21a7c04a4ec6d443ad724d14768a331cdea155"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.51/linux-x64/rql-1.6.51-linux-x64.tar.gz"
      sha256 "513e316526a51a4b6bc920a633c1eddc18b829bd4c52e29dbb9da35c101c49e8"
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
