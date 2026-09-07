# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.1"

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
      url "https://downloads.repoql.ai/1.7.1/osx-arm64/rql-1.7.1-osx-arm64.tar.gz"
      sha256 "88caf8d822ef28605479ab639605940e4449f8b8e077f09777f9fde9269028ba"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.1/osx-x64/rql-1.7.1-osx-x64.tar.gz"
      sha256 "27a66f5121c605ec60094058f232a04e7a078e35ab175c870d837d3396c0c253"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.1/linux-arm64/rql-1.7.1-linux-arm64.tar.gz"
      sha256 "352c0e28322d85be55a2f74cf9849e9c9e08a3ccb76e73dff35f889c0d6ee002"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.1/linux-x64/rql-1.7.1-linux-x64.tar.gz"
      sha256 "c3d6aafadce1f86cfceb720af4fe3562842f79b5809b8f6c370b1b14b6c9f3b1"
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
