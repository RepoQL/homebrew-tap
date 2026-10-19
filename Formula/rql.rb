# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.15"

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
      url "https://downloads.repoql.ai/1.7.15/osx-arm64/rql-1.7.15-osx-arm64.tar.gz"
      sha256 "59194d134b4523f5aa1a05bfdc345f4126857493912b6aba1770f2486db4bd50"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.15/osx-x64/rql-1.7.15-osx-x64.tar.gz"
      sha256 "024d8f3f95f3baacf87e0e7e9b2804ecc6ee71ddcd0b6cf60a8e35a24f06db68"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.15/linux-arm64/rql-1.7.15-linux-arm64.tar.gz"
      sha256 "9684e12a41543cabffd3974200f02cad9272e3fa4d3d0b789d1c98844adf0b39"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.15/linux-x64/rql-1.7.15-linux-x64.tar.gz"
      sha256 "dfe995ecfd96e79ee69236fd18a66aeafd75b65e5c84cf7439e3f24e6c1d7e44"
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
