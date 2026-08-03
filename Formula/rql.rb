# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.41"

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
      url "https://downloads.repoql.ai/1.6.41/osx-arm64/rql-1.6.41-osx-arm64.tar.gz"
      sha256 "0231547fc3744a8e3233ce734001a3c3986ea95f87e447ac2303013d809bc8d3"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.41/osx-x64/rql-1.6.41-osx-x64.tar.gz"
      sha256 "ccfb19088d1e51a12f5beb8aa7bc0745c98acd280a222045c2d1d7c5aa375448"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.41/linux-arm64/rql-1.6.41-linux-arm64.tar.gz"
      sha256 "3f977670f3107e13676b3eda6d2d8c53e7351a328511f8b2e1ac4df72b7f8094"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.41/linux-x64/rql-1.6.41-linux-x64.tar.gz"
      sha256 "fc63adbfb3f8e60d0856f1f6b84eec5d7cb06d9d8df7bff75e7c04bac026be11"
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
