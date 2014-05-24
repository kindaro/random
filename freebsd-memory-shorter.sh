{ sysctl hw.physmem ; vmstat -s | grep -w -e active -e inactive -e 'in VM cache' -e 'wired down' -e free -e 'bytes per page' ; swapinfo ; top -d 1 | grep -e Mem -e Swap ; }
