# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.54"

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
      url "https://downloads.repoql.ai/1.6.54/osx-arm64/rql-1.6.54-osx-arm64.tar.gz"
      sha256 "6a3b57a70bca9b422acd654fd30440a21a591ae0b0ee66ae45a562707cda0ca9"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.54/osx-x64/rql-1.6.54-osx-x64.tar.gz"
      sha256 "16594a65c6cc0869ebfc051a574da9b83b293bb6986955bb3b79529bd17f40e8"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.54/linux-arm64/rql-1.6.54-linux-arm64.tar.gz"
      sha256 "78f0f7b84a96be981037e63af45d7b1867a0b0533d70b6f8a694d515d7d88475"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.54/linux-x64/rql-1.6.54-linux-x64.tar.gz"
      sha256 "a07a4ac901c6983323519e0fe71810c9dee9dd4c7a520a89c75aef0c5f8ba045"
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
