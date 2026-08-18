# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.49"

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
      url "https://downloads.repoql.ai/1.6.49/osx-arm64/rql-1.6.49-osx-arm64.tar.gz"
      sha256 "a958d0730d92a17772ec4b8711eaa0ab39f1f475367bf5f42dba6000180b9bf2"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.49/osx-x64/rql-1.6.49-osx-x64.tar.gz"
      sha256 "082cea25de7d759890cb7aedf26da2054dae5df616a99f2e963ec1f4d9317f6a"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.49/linux-arm64/rql-1.6.49-linux-arm64.tar.gz"
      sha256 "ee0fd5c624d22d30274f5cf1eaaac52b1a00d9373d5ac4bf036e6b2a4b258542"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.49/linux-x64/rql-1.6.49-linux-x64.tar.gz"
      sha256 "184c79b23355fa8e3750cd6607f5507d0180279d34815cd1b4b271a84eb74f73"
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
