# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.5"

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
      url "https://downloads.repoql.ai/1.7.5/osx-arm64/rql-1.7.5-osx-arm64.tar.gz"
      sha256 "53fb43f0e9137037dceb0e92701f24d3c3e1fa825b3f76e9dd1e359e207c9ccc"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.5/osx-x64/rql-1.7.5-osx-x64.tar.gz"
      sha256 "b5c333b5d5c059293265438b95509a63e0614e7d5d77dbc9315adbf5241eb749"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.5/linux-arm64/rql-1.7.5-linux-arm64.tar.gz"
      sha256 "d67cd1091c634cb67bce847130d9b0e76dee55b6287b420b4dec7136148135b7"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.5/linux-x64/rql-1.7.5-linux-x64.tar.gz"
      sha256 "0d265b52786ee56c432245d5c5df34efa24b2d4c2f6680c38320f4dfcf183b45"
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
