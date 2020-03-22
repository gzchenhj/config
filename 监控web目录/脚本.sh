清除日志:
#!/bin/bash
cd /var/log/
cat /dev/null >messages
echo "logs cleaned up"

