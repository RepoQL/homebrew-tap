# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.8"

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
      url "https://downloads.repoql.ai/1.7.8/osx-arm64/rql-1.7.8-osx-arm64.tar.gz"
      sha256 "8c281a6e4816171021c8f9ec5205ab4cde5034eef322ee7213b3e7573cbe3796"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.8/osx-x64/rql-1.7.8-osx-x64.tar.gz"
      sha256 "072c4c7a4bbf056ce9b453febbd065ef448625a97b861245b0c65a9760b397f2"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.8/linux-arm64/rql-1.7.8-linux-arm64.tar.gz"
      sha256 "7dcd72ad34995be609d830f3f99ceb2e7b0084c33d72fa68513ba4b20ea48880"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.8/linux-x64/rql-1.7.8-linux-x64.tar.gz"
      sha256 "a01627069a46ca88ae3dfe534fa75189a1135694d925a3c93f315c434ad0acca"
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
