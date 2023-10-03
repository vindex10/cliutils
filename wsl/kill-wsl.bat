echo "listing all wsl tasks"
tasklist /M wsl*

echo "sending kill to wslservice"
taskkill /IM wslservice.exe /F

echo "Done"