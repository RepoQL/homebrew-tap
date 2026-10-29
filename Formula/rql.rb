# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.19"

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
      url "https://downloads.repoql.ai/1.7.19/osx-arm64/rql-1.7.19-osx-arm64.tar.gz"
      sha256 "b2e6b7959533f8205eef1c3d702f70d8ba853c406df488a4d288c09e60b5a595"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.19/osx-x64/rql-1.7.19-osx-x64.tar.gz"
      sha256 "58800c139dfe31b940c7ceae9dfb50cc2cd37d9574238d57010abf69181c8ecf"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.19/linux-arm64/rql-1.7.19-linux-arm64.tar.gz"
      sha256 "06b086198774c0963f3dea2e4091ebe894eba40e851bf02006c9232dd507a209"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.19/linux-x64/rql-1.7.19-linux-x64.tar.gz"
      sha256 "0b8c382f2a9453ae0047bbc2b2196b53071cd4380527619d4fb037f8d8f88a8d"
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
