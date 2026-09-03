# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.57"

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
      url "https://downloads.repoql.ai/1.6.57/osx-arm64/rql-1.6.57-osx-arm64.tar.gz"
      sha256 "815a1bb14a1e8c51a522419bb001d5657f9199070d6f9078ae1a178a9912c70d"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.57/osx-x64/rql-1.6.57-osx-x64.tar.gz"
      sha256 "c7467f2c8268fb28a61125fc433947cda813cbe090f5c1e5d629eb5a257b3b7c"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.57/linux-arm64/rql-1.6.57-linux-arm64.tar.gz"
      sha256 "548bc0d71cc553e3c7c83feb6575a92da4b9aac2306e62554132630ff315c391"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.57/linux-x64/rql-1.6.57-linux-x64.tar.gz"
      sha256 "0180433e896c8d29b0ec6a817f2f67601188e685e75fe283cf795076428ef062"
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
