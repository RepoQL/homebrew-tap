# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.13"

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
      url "https://downloads.repoql.ai/1.7.13/osx-arm64/rql-1.7.13-osx-arm64.tar.gz"
      sha256 "464ee668ecc46d18e434bd522b856b0ae6c018f6112ba3b723e5bfeafe47b224"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.13/osx-x64/rql-1.7.13-osx-x64.tar.gz"
      sha256 "971de7c03c4ed2f9ca88b0b2f6c4767fec08e6902bb06cb63ffc8067b7697915"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.13/linux-arm64/rql-1.7.13-linux-arm64.tar.gz"
      sha256 "10b772eb480eb98a1d83b57e8c909f1fc3b531698b7529fdcc7221ca1f81f22e"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.13/linux-x64/rql-1.7.13-linux-x64.tar.gz"
      sha256 "fe1393df7a77c85f1c2bfc6bc5c08c8c6d1222bdc780c51d69ede356284dfdfb"
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
