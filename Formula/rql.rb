# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.46"

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
      url "https://downloads.repoql.ai/1.6.46/osx-arm64/rql-1.6.46-osx-arm64.tar.gz"
      sha256 "2e8484b4d3c81398e0f7040b2da14b0be9a0d285d4f78c52ce2d57489d2e873a"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.46/osx-x64/rql-1.6.46-osx-x64.tar.gz"
      sha256 "b64ff6764354795dc609bce5f8447e59f01e240288282929f949f00b616270e3"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.46/linux-arm64/rql-1.6.46-linux-arm64.tar.gz"
      sha256 "25a74e7bd86d802c179a847e8a41bb7b2e0560ac5d9fabb9e51a6da42139a35f"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.46/linux-x64/rql-1.6.46-linux-x64.tar.gz"
      sha256 "084e531d4a26a1a44d5cbc0d5422626063b26a251413275f398e61e960e5bead"
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
