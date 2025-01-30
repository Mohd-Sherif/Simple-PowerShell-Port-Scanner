Param(
    [Parameter(
        Position = 0,
        Mandatory = $true,
        HelpMessage = 'Hostname or IPv4-Address of the device which you want to scan'
    )]
    [String]$ip,

    [Parameter(
        Position = 1,
        Mandatory = $true,
        HelpMessage = 'Ports which should be scanned (e.g., 80, 443, 22). Default = 80, 22'
    )]
    [ValidateScript({
        $_ | ForEach-Object {
            if ($_ -lt 1 -or $_ -gt 65535) {
                throw "Port $_ is out of range. Valid ports are between 1 and 65535."
            }
        }
        $true
    })]
    [array]$ports = @(80, 22)
)

function Test-Port {
    param (
        [string]$ip,
        [int]$port,
        [int]$timeout = 1000 # Timeout in milliseconds
    )
    try {
        # Create a TCP client with a timeout
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $connectTask = $tcpClient.ConnectAsync($ip, $port)
        
        # Suppress the boolean output from Wait()
        $null = $connectTask.Wait($timeout)

        if ($tcpClient.Connected) {
            Write-Host "$ip`:$port - Opened" -ForegroundColor Green
            $tcpClient.Close()
        } else {
            Write-Host "$ip`:$port - Closed (Timeout)" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "$ip`:$port - Closed (Error: $($_.Exception.Message))" -ForegroundColor Red
    } finally {
        if ($tcpClient -and $tcpClient.Connected) {
            $tcpClient.Close()
        }
    }
}

Write-Host "`nScanning $ip on ports: $($ports -join ', ')`n" -ForegroundColor Cyan

foreach ($port in $ports) {
    Test-Port -ip $ip -port $port
}

Write-Host "`nScan completed.`n" -ForegroundColor Cyan