# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.20"

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
      url "https://downloads.repoql.ai/1.7.20/osx-arm64/rql-1.7.20-osx-arm64.tar.gz"
      sha256 "20384edfbd5249ab11972459ea8d889c1791d38dc1eb3d81aa0df433fca3f080"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.20/osx-x64/rql-1.7.20-osx-x64.tar.gz"
      sha256 "b861b6f8e361bc7f6a5be42ecde575c071d632f5fdf69f4ff2e3da45e0f5d52e"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.20/linux-arm64/rql-1.7.20-linux-arm64.tar.gz"
      sha256 "12a9b83b12fb99090762cad45e6e4568e71e0f01d7933ee64eebf013d67d1283"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.20/linux-x64/rql-1.7.20-linux-x64.tar.gz"
      sha256 "9f05019b0e815034b78eda969bafda24c85ad493d5e23cadb8299bfe9e4fa2db"
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
