# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.35"

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
      url "https://downloads.repoql.ai/1.6.35/osx-arm64/rql-1.6.35-osx-arm64.tar.gz"
      sha256 "2881276f460fcb1e6b4840604fa4574f8822c1d5d34596c656d1d6fad179f273"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.35/osx-x64/rql-1.6.35-osx-x64.tar.gz"
      sha256 "e0e1cd9d60b7aa2ebb4728c3ce7ec9043734cb6844be28f335262e31bdff71e7"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.35/linux-arm64/rql-1.6.35-linux-arm64.tar.gz"
      sha256 "9f6443d59c002bf28738c9f0f6a1efdb5564733f7afdaf5fbb88685bd4905250"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.35/linux-x64/rql-1.6.35-linux-x64.tar.gz"
      sha256 "1913fa00748ae49a8eb5e4367785a72518ad6c6aec97ede6767bdf36811bcfcb"
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
