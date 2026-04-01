class DigitalLogic < Formula
  desc "Digital logic designer and circuit simulator for educational purposes"
  homepage "https://github.com/hneemann/Digital"
  url "https://github.com/hneemann/Digital/releases/latest/download/Digital.zip"
  version "0.31"
  sha256 "12f014c8b99140554f8f7464ebc771bbe3de6af39c83c20463492bcb892afc69"
  license "GPL-3.0-only"

  depends_on "openjdk@17"

  def install
    libexec.install "Digital/Digital.jar"

    (bin/"digital").write <<~EOS
      #!/bin/bash
      exec "#{Formula["openjdk@17"].opt_bin}/java" -jar "#{libexec}/Digital.jar" "$@"
    EOS
  end

  test do
    assert_predicate libexec/"Digital.jar", :exist?
  end
end