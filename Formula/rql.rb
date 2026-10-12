# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.14"

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
      url "https://downloads.repoql.ai/1.7.14/osx-arm64/rql-1.7.14-osx-arm64.tar.gz"
      sha256 "e22ff91c61a48177360b74d80ebf4d35eaaf90c9dcedb2ebf13123f12f2b450f"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.14/osx-x64/rql-1.7.14-osx-x64.tar.gz"
      sha256 "4a369fed7a8d46f35a348c412087cd014c84fbb26cb96c96478dbc91f6820b7a"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.14/linux-arm64/rql-1.7.14-linux-arm64.tar.gz"
      sha256 "91df38774de51205926bbda932fc06e9713d9e3bd400aaf6eea03c0f933f93e1"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.14/linux-x64/rql-1.7.14-linux-x64.tar.gz"
      sha256 "cf7b030fbac947ac0be1715e1a5e80ffa489b9ce7294470636baef07b0d0a866"
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
