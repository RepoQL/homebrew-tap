# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.36"

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
      url "https://downloads.repoql.ai/1.6.36/osx-arm64/rql-1.6.36-osx-arm64.tar.gz"
      sha256 "fc7fc602f363a2c9199be662203abcb4ea2fc171ad00e32f4aa055dbacd7d7e1"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.36/osx-x64/rql-1.6.36-osx-x64.tar.gz"
      sha256 "e3f268cf0cf1f344884e3b038d16fd4ea7801194e6fdf78011a45aa93ed729c2"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.36/linux-arm64/rql-1.6.36-linux-arm64.tar.gz"
      sha256 "474cc11bb9f54900472bddb498ccec920fe5bf1638a74e923716ab5f2721e58f"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.36/linux-x64/rql-1.6.36-linux-x64.tar.gz"
      sha256 "568001070dd9ca6a90ce8083289f83a8631a3ae433bd283d1ed356676e5b3bf3"
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
