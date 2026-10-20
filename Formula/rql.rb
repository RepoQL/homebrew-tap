# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.16"

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
      url "https://downloads.repoql.ai/1.7.16/osx-arm64/rql-1.7.16-osx-arm64.tar.gz"
      sha256 "e17d8ae0e21469516c1ea7dfbc0afcef909811f8526ce3002a3305e4d689bf2d"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.16/osx-x64/rql-1.7.16-osx-x64.tar.gz"
      sha256 "d3e21e80792efb90f0b738bbb94ba5e01630483977e88bf1615282a81ff41f35"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.16/linux-arm64/rql-1.7.16-linux-arm64.tar.gz"
      sha256 "450a0f41272005584a2acfd6e36b02058e96b912474d6d05ab02ea33406ad0da"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.16/linux-x64/rql-1.7.16-linux-x64.tar.gz"
      sha256 "0d19f380d828ea9d03b779b97ba8c2197da56e00196f8e5efaebfcd110aa7eb5"
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
