# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.22"

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
      url "https://downloads.repoql.ai/1.7.22/osx-arm64/rql-1.7.22-osx-arm64.tar.gz"
      sha256 "88c8d64827c6c46a99e81ddd8bcf342e5afdc0144adee57b9e4802b5aa638af7"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.22/osx-x64/rql-1.7.22-osx-x64.tar.gz"
      sha256 "833f6e9b5f77251b9fbfa847e193cfacd87fed2786615fd2ae07b6d3d8067172"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.22/linux-arm64/rql-1.7.22-linux-arm64.tar.gz"
      sha256 "cb14ba200350487eac329993df9fd88c1095650f442d38763464a02b98a5fa94"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.22/linux-x64/rql-1.7.22-linux-x64.tar.gz"
      sha256 "bda68318eaeef3ae99ba184999eae826045f169ee21e68a1751b876b6cb196a7"
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
