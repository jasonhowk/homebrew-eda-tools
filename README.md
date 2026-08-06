# homebrew-eda-tools

A Homebrew tap providing Electronic Design Automation (EDA) tools for macOS. Optimized for Apple Silicon.

Pre-built bottles for `arm64_sequoia` are available for **Icarus Verilog** and **GTKWave 4**, so those install without a local compile. **Digital** does not require a build — it installs a pre-packaged JAR and shell wrapper, with OpenJDK 17 pulled in automatically as a dependency.

## One-Shot Install
The easiest way to install all three tools directly in macOS terminal:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jasonhowk/homebrew-eda-tools/main/install.sh)"
```

## Tap

```bash
brew tap jasonhowk/eda-tools
```

## Tools

### [Icarus Verilog](https://steveicarus.github.io/iverilog/) `v12.0`

A Verilog HDL compiler and simulator. Supports compilation of Verilog source files and simulation of digital designs.

```bash
brew install jasonhowk/eda-tools/icarus-verilog@12
```

```bash
# Compile and simulate
iverilog -o sim.vvp design.v testbench.v
vvp sim.vvp
```

### [Digital](https://github.com/hneemann/Digital) `v0.31`

A visual digital logic designer and circuit simulator. Useful for learning and prototyping combinational and sequential logic. Requires Java (OpenJDK 17, installed automatically).

```bash
brew install jasonhowk/eda-tools/digital-logic
```

```bash
digital
```

### [GTKWave 4](https://github.com/gtkwave/gtkwave) `v4.0.0-prealpha`

A GTK4-based waveform viewer for inspecting VCD and FST output files from Verilog/VHDL simulations. This is a pre-release build.

```bash
brew install jasonhowk/eda-tools/gtkwave4
```

```bash
gtkwave output.vcd
```

## Pre-built Bottles

Binary bottles for `arm64_sequoia` (Apple Silicon, macOS Sequoia) are available for Icarus Verilog and GTKWave 4, so installation does not require a local build. Bottles are published to GitHub Releases via automated CI workflows.

## License

[MIT](LICENSE)
