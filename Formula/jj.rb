class Jj < Formula
  desc "jump jump — directory bookmarking tool"
  homepage "https://github.com/Patrik-Stas/jj"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Patrik-Stas/jj/releases/download/v#{version}/_jj-darwin-arm64"
      sha256 "571c9fffbd73e63fe93c4658f008917018eb5030c707a5647e8da1d1010b6cc0"

      def install
        bin.install "_jj-darwin-arm64" => "_jj"
      end
    else
      url "https://github.com/Patrik-Stas/jj/releases/download/v#{version}/_jj-darwin-amd64"
      sha256 "3dc3fcfcd0e719f4d08e98c9567673e147fceaffeb0bcc316bd0f0c7ed69220d"

      def install
        bin.install "_jj-darwin-amd64" => "_jj"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Patrik-Stas/jj/releases/download/v#{version}/_jj-linux-arm64"
      sha256 "6ef9d146307a24173643825425c818b8f89a0a74b4b3f4c03a57ca3838bbd8d2"

      def install
        bin.install "_jj-linux-arm64" => "_jj"
      end
    else
      url "https://github.com/Patrik-Stas/jj/releases/download/v#{version}/_jj-linux-amd64"
      sha256 "76f4abef0d42567e0aa6fb841133e26d30424b76513f389c5f4f7db6bd928a13"

      def install
        bin.install "_jj-linux-amd64" => "_jj"
      end
    end
  end

  def caveats
    <<~EOS
      Add the following to your shell config:

        For zsh (~/.zshrc):
          eval "$(_jj init zsh)"

        For bash (~/.bashrc):
          eval "$(_jj init bash)"
    EOS
  end

  test do
    assert_match "jj — jump jump", shell_output("#{bin}/_jj init zsh")
  end
end
