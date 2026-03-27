class IcarusVerilogAT12 < Formula
  desc "Verilog simulation and synthesis tool (version 12.0)"
  homepage "https://steveicarus.github.io/iverilog/"
  url "https://github.com/steveicarus/iverilog/archive/refs/tags/v12_0.tar.gz"
  sha256 "a68cb1ef7c017ef090ebedb2bc3e39ef90ecc70a3400afb4aa94303bc3beaa7d"
  license "GPL-2.0-or-later"

  bottle do
  root_url "https://github.com/jasonhowk/homebrew-iverilog-v12/releases/download/icarus-verilog%4012-12.0"
  sha256 cellar: :any, arm64_sequoia: "502a7aa782f6ea1f8314845c3752bf2afd4f2fc41b88bf60871d27637cedc449"
end

  depends_on "autoconf" => :build
  depends_on "bison" => :build
  depends_on "gperf" => :build

  def install
    # mach-o/dyld.h must be included at top of file, not inside #elif block
    inreplace "driver/main.c",
      /^(#include <stdlib\.h>)/,
      "#include <mach-o/dyld.h>\n\\1"

    system "sh", "autoconf.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/iverilog", "-V"
  end
end