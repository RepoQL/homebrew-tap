# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.2"

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
      url "https://downloads.repoql.ai/1.7.2/osx-arm64/rql-1.7.2-osx-arm64.tar.gz"
      sha256 "3b032e63b3068fe78d7159be44ef42819e35d117f97980004abf7de15ec97822"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.2/osx-x64/rql-1.7.2-osx-x64.tar.gz"
      sha256 "e5cb8c14efc616ec594f31fc8e251900d94059b715c301861dc66fd2ca6df14e"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.2/linux-arm64/rql-1.7.2-linux-arm64.tar.gz"
      sha256 "0673fe87c0e94ffd28d1d3fe4627c2e94d23dfdf8208dac2d1aed6522cca8b31"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.2/linux-x64/rql-1.7.2-linux-x64.tar.gz"
      sha256 "91494bd706bd288f251a188a28ba4ada3fb74f092da336f726c638252a1da264"
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
