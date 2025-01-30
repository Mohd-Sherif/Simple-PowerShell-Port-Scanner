# Simple PowerShell Port Scanner

A simple and efficient PowerShell script to scan ports on a specified IP address or hostname.

## Features

- **Customizable Ports**: Specify the ports you want to scan. The default ports are 80 and 22.
- **Timeout Handling**: Configurable timeout for each port scan.
- **Clear Output**: Color-coded output to easily identify open, closed, or timed-out ports.
- **Error Handling**: Provides detailed error messages if something goes wrong during the scan.

## Usage
   ```powershell
   .\PortScanner.ps1 -ip <IP_ADDRESS> -ports <PORT_LIST>
   ```

## Example:
   ```powershell
   .\PortScanner.ps1 -ip 192.168.1.1 -ports 80,443,22
   
   Scanning 192.168.1.1 on ports: 80, 443, 22
   
   192.168.1.1:80 - Opened
   192.168.1.1:443 - Closed (Timeout)
   192.168.1.1:22 - Opened
   
   Scan completed.
