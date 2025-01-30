# Simple PowerShell Port Scanner

A simple and efficient PowerShell script to scan ports on a specified IP address or hostname.

## Features

- **Customizable Ports**: Specify the ports you want to scan. The default ports are 80 and 22.
- **Timeout Handling**: Configurable timeout for each port scan.
- **Clear Output**: Color-coded output to easily identify open, closed, or timed-out ports.
- **Error Handling**: Provides detailed error messages if something goes wrong during the scan.

## Usage
1. Run the script:
   ```powershell
   .\PortScanner.ps1 -ip <IP_ADDRESS> -ports <PORT_LIST>
