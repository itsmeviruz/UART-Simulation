# UART Simulation

[![Language: Verilog](https://img.shields.io/badge/Language-Verilog-blue)](https://www.verilog.com/)  
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](https://opensource.org/licenses/MIT)

A **UART (Universal Asynchronous Receiver/Transmitter) simulation** project implemented in Verilog. Includes transmitter, receiver, top-level integration, and a testbench for simulation.

---

## 📂 Project Structure

UART-Simulation/
│── src/ # Verilog source files
│ ├── uart_tx.v
│ ├── uart_rx.v
│ └── uart_top.v
│── sim/ # Testbench and simulation outputs
│ ├── uart_tb.v
│ └── uart.vcd
│── README.md # Project documentation


---

## 🔹 Description

- **uart_tx.v** – UART transmitter module  
- **uart_rx.v** – UART receiver module  
- **uart_top.v** – Top-level module integrating transmitter and receiver  
- **uart_tb.v** – Testbench to simulate UART operations  
- **uart.vcd** – Simulation waveform output  

---

## ⚡ Getting Started

### Prerequisites

- Icarus Verilog ([Installation guide](http://iverilog.icarus.com/))  
- GTKWave ([Download](http://gtkwave.sourceforge.net/))

### Compile and Simulate

1. Open terminal in your project folder.
2. Compile all Verilog files:

```bash
iverilog -o uart_sim sim/uart_tb.v src/uart_tx.v src/uart_rx.v src/uart_top.v

### run the simulink 

vvp uart_sim

### to view the waveform
gtkwave sim/uart.vcd
