class EdaTools < Formula
  desc "EDA toolchain: Icarus Verilog v12, Digital logic simulator, and GTKWave"
  homepage "https://github.com/jasonhowk/homebrew-eda-tools"
  head "https://github.com/jasonhowk/homebrew-eda-tools.git", branch: "main"
  license "GPL-3.0-only"

  depends_on "jasonhowk/eda-tools/icarus-verilog@12"
  depends_on "jasonhowk/eda-tools/digital-logic"
  depends_on "jasonhowk/eda-tools/gtkwave"

  def install
    # intentionally empty — this is a meta-formula
  end

  test do
    system "iverilog", "-V"
    assert_predicate libexec/"Digital.jar", :exist?
    system "#{Formula["gtkwave"].bin}/gtkwave", "--version"
  end
end