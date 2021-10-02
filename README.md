# UART_TX
 This project is made by Quartus Lite

- ## Goal
    - Creating a UART TX with some properties below:
    <br> 1. BaudRate : 9600
    <br> 2. Data : 8 bits
    <br> 3. None Parity
    <br> 4. 1 Stop Bit
    - When Write Pin input a negative edge, it should read write_value as TX data, and transfer the datas which are in the UART_TXD.
    - Using hw1_tb.v as Top level bench
    - It require  Synchronous Design, and it should use clk_50M or reset as clock, it can't use other signal as clock.
---
- ## Result
    - Log text
    <br> ![1](./文字結果.jpg)

    - The result of waveform graph
    <br> ![1](./波形圖.jpg)
