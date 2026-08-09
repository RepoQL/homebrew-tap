# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.44"

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
      url "https://downloads.repoql.ai/1.6.44/osx-arm64/rql-1.6.44-osx-arm64.tar.gz"
      sha256 "a50b6a1e75d4f20e965cf813f7c98fb2fcc83b096f8214ec64029af03a0ac451"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.44/osx-x64/rql-1.6.44-osx-x64.tar.gz"
      sha256 "a60177352b9fa36c32e23e587e362b7b98107f2a1988571c1a50712dac2ffb84"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.44/linux-arm64/rql-1.6.44-linux-arm64.tar.gz"
      sha256 "157a34a29b2fea8e766e2d3840ba272f1d0dfbf9e0b80093b6abfa397212a59b"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.44/linux-x64/rql-1.6.44-linux-x64.tar.gz"
      sha256 "9421f4e3637d628720410b28b9975d2f0f34cc075d8ef710ac4ee04b037726c4"
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
