# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.com"
  version "1.6.50"

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
      url "https://downloads.repoql.ai/1.6.50/osx-arm64/rql-1.6.50-osx-arm64.tar.gz"
      sha256 "d547e55e8a39bb717068639c1b58155bef3e85e94a42a6dbd13615dccf752e44"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.50/osx-x64/rql-1.6.50-osx-x64.tar.gz"
      sha256 "f7284edd58de40eec1ee8fa10aeeb894c3fa9000f7bd65a2997a3f49d2bbaca8"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.50/linux-arm64/rql-1.6.50-linux-arm64.tar.gz"
      sha256 "2c21f2e76abe6c372a35ecb02ad48a990802fbce83a5fe3e1baabfc951387223"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.50/linux-x64/rql-1.6.50-linux-x64.tar.gz"
      sha256 "ce3f222ae2403219a32cfb2c23a9545e411f4e7a88f91e8dd8a77d969c6aba65"
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
