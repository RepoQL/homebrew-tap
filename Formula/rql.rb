# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.3"

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
      url "https://downloads.repoql.ai/1.7.3/osx-arm64/rql-1.7.3-osx-arm64.tar.gz"
      sha256 "ff55fa62acb2344c2eecbaef2f86f600920b95ad09c9a25c272a0ab195b7b181"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.3/osx-x64/rql-1.7.3-osx-x64.tar.gz"
      sha256 "3c79aea8b0ecc2e291228c3af81b12b76e14600ffbb300c9756acaa7be1419b2"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.3/linux-arm64/rql-1.7.3-linux-arm64.tar.gz"
      sha256 "2cdcaac7525b3a025211691bfb85a02a7d87373d43b8f3c5654b1fe7a4ce02a3"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.3/linux-x64/rql-1.7.3-linux-x64.tar.gz"
      sha256 "e0cc21291b28eca44090daeeeecab575b59cc2857fbf3d3a4801cc3a58caa1c3"
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
