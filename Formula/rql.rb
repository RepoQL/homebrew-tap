# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.7.11"

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
      url "https://downloads.repoql.ai/1.7.11/osx-arm64/rql-1.7.11-osx-arm64.tar.gz"
      sha256 "54b2b869fb29864c625d8d43b0fd22611e49fc2a25561cae886cd4cf608875ae"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.11/osx-x64/rql-1.7.11-osx-x64.tar.gz"
      sha256 "5ca201a1a1758e839540e488dc31a60f8392f9eac3df566680860598e6a23a5f"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.7.11/linux-arm64/rql-1.7.11-linux-arm64.tar.gz"
      sha256 "74efd6be4e7209301e7d0ccad6c7afbdd71b6b211ddc64a16a3e9ccc59c3ea41"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.7.11/linux-x64/rql-1.7.11-linux-x64.tar.gz"
      sha256 "97405414580eec4d23b123d18ceebcc938aeb96cc31a360ed49b64e8773647ce"
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
