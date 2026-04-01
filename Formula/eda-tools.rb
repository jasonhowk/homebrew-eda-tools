class EdaTools < Formula
  desc "EDA toolchain: Icarus Verilog v12, Digital logic simulator, and GTKWave"
  homepage "https://github.com/jasonhowk/homebrew-eda-tools"
  license "GPL-3.0-only"

  depends_on "jasonhowk/eda-tools/icarus-verilog-v12"
  depends_on "jasonhowk/eda-tools/digital-logic"
  depends_on cask: "randomplum/gtkwave/gtkwave"

  def install
    # intentionally empty — this is a meta-formula
  end

  test do
    system "iverilog", "-V"
    assert_predicate libexec/"Digital.jar", :exist?
  end
end