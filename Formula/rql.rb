# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.42"

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
      url "https://downloads.repoql.ai/1.6.42/osx-arm64/rql-1.6.42-osx-arm64.tar.gz"
      sha256 "0c7045f0a8c91b126017db15a34325e7da94af3777f08773cab3e6e7ce464793"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.42/osx-x64/rql-1.6.42-osx-x64.tar.gz"
      sha256 "868e0acf9c0a26b9f46cbf1fee28a8f89981175984d95a3a2add8689b3322e3a"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.42/linux-arm64/rql-1.6.42-linux-arm64.tar.gz"
      sha256 "7461399fe1dcd817e919dde364587c3faa662ce7c51b32ddd286b3f915f0f8e9"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.42/linux-x64/rql-1.6.42-linux-x64.tar.gz"
      sha256 "0c45f42e565b4331fb2a67a7a312c3a8b9824aeb9dc6a46297d9de9c2487a833"
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
