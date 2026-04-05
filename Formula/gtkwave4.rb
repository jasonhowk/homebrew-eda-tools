class Gtkwave4 < Formula
  desc "GTK4 based wave viewer for Verilog and VHDL simulations (pre-release)"
  homepage "https://github.com/gtkwave/gtkwave"
  url "https://github.com/gtkwave/gtkwave/archive/1dbe6d02196f5badd13a25adb02a19a11e7dd2eb.tar.gz"
  version "4.0.0-prealpha-1dbe6d02"
  sha256 "56f5ead9f253e5d2b1ff1e448b9c7afa797e054584692457f2ad19360f4fcf67"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/jasonhowk/homebrew-eda-tools/releases/download/gtkwave4-4.0.0-prealpha-1dbe6d02"
    sha256 cellar: :any, arm64_sequoia: "dbdd6805a9898545fec6c720f55a9041fa397f7ec8c6b49ab53e7a41787543ba"
  end

  resource "libfst" do
    url "https://github.com/gtkwave/libfst/archive/74301348450701727776c1a0522a3f512738e9ae.tar.gz"
    sha256 "b2bdd572310fddf5d66aa14c6062342c9f899d66439d0203efa68bc3e77a8bc0"
  end

  depends_on "desktop-file-utils" => :build
  depends_on "gobject-introspection" => :build
  depends_on "gtk-mac-integration" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "shared-mime-info" => :build
  depends_on "gtk+3"
  depends_on "gtk4"
  depends_on "json-glib"

  def install
    resources.each do |r|
      r.stage { (buildpath/"subprojects"/r.name).install Dir["*"] }
    end

    system "meson", "setup", "build",
           "--force-fallback-for=libfst",
           *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end

  test do
    system "#{bin}/gtkwave", "--version"
  end
end
