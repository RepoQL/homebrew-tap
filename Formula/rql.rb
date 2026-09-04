# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.0"

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
      url "https://downloads.repoql.ai/1.7.0/osx-arm64/rql-1.7.0-osx-arm64.tar.gz"
      sha256 "46d26c39bf3755af2554237fef2936e9d88992d216fbfcc5ed66e2de58353b87"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.0/osx-x64/rql-1.7.0-osx-x64.tar.gz"
      sha256 "1859196dd422a930451000c16e783b67c2ccbd214809493be86abbee382b5ccf"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.0/linux-arm64/rql-1.7.0-linux-arm64.tar.gz"
      sha256 "f9c4aa869b3410035ba126ca4009ff2977fe9d37efad69fd0020bcb2122d0b8c"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.0/linux-x64/rql-1.7.0-linux-x64.tar.gz"
      sha256 "1ca48523e7d88265b39a5c05362a3ffefc489fd5a9b2a6325b45bcce1d7f45bd"
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
