# typed: false
# frozen_string_literal: true

class Lore < Formula
  desc "Local-first engineering memory system"
  homepage "https://github.com/meredian-labs/lore"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meredian-labs/lore/releases/download/v0.1.0/lore_darwin_arm64.tar.gz"
      sha256 "70f6d05712c31da67aac73845e5310ea3595abe63bfd46f09d3c928679df610f"
    else
      url "https://github.com/meredian-labs/lore/releases/download/v0.1.0/lore_darwin_amd64.tar.gz"
      sha256 "fef7da6c3c7d01ba59267d95e74f96b9debf104ed97a38c17c85a2f81c2d92c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/meredian-labs/lore/releases/download/v0.1.0/lore_linux_arm64.tar.gz"
      sha256 "03dc76dd7ac1f0a020a9cc5ffabf0eee5ae84edfb96692e6c3715c75b4df49ec"
    else
      url "https://github.com/meredian-labs/lore/releases/download/v0.1.0/lore_linux_amd64.tar.gz"
      sha256 "361d1e47a4dd7b50b2225654af9588d03aef86f60199585caae1c389f1909d78"
    end
  end

  def install
    bin.install "lore"
    bin.install_symlink "lore" => "glh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lore --version")
  end
end
