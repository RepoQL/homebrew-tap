# Rendered by RepoQL.Core's publish workflow (build/homebrew/render-formula.sh).
# Do not edit the rendered copy in the tap by hand — the next release overwrites it.
class Rql < Formula
  desc "Structural code index that gives coding agents extra senses"
  homepage "https://repoql.ai"
  version "1.6.32"

  on_macos do
    on_arm do
      url "https://downloads.repoql.ai/1.6.32/osx-arm64/rql-1.6.32-osx-arm64.tar.gz"
      sha256 "0544555533c2703bbff06deffde70c403703cfe4129fe6e913d656f425a80923"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.32/osx-x64/rql-1.6.32-osx-x64.tar.gz"
      sha256 "198855e8a0be38882d9817f63ae16fe40475baa3853799bd1de69fab65c22f1f"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.repoql.ai/1.6.32/linux-arm64/rql-1.6.32-linux-arm64.tar.gz"
      sha256 "0f58a9ece8b190d70a85ef314df0f6965ea283da5dda165e33c099d4c5d10c60"
    end
    on_intel do
      url "https://downloads.repoql.ai/1.6.32/linux-x64/rql-1.6.32-linux-x64.tar.gz"
      sha256 "e4a7763856e730fe085b808b64f38f967898470162b9fab145705186f83c01d9"
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

  livecheck do
    url "https://downloads.repoql.ai/latest/version.txt"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rql --version")
  end
end
