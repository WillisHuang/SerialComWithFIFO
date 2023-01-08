# Serial Communication Transfer

## Purpose
1. Read the datas from spi.
2. Decode the command, and select the corresponding interface(I2C / SPI).
3. Transfer the datas to the chip through the selected interface.

## Architecture Overview with Transmitter and Receiver
![image](https://github.com/WillisHuang/SerialComWithFIFO/blob/main/architecture/tx_rx.png)
### Architecture of transmitter
![image](https://github.com/WillisHuang/SerialComWithFIFO/blob/main/architecture/tx.png)
### Architecture of Receiver
![image](https://github.com/WillisHuang/SerialComWithFIFO/blob/main/architecture/rx.png)

