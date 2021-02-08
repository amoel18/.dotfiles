#!/usr/bin/env bash
# config: exec_always /home/piotr/PycharmProjects/swayinfo/wsdnames.sh

# Do not forget to change the path according to the script location!
pkill -f "python3 /home/i/.scripts/wsdnames.py"
/home/i/.scripts/wsdnames.py &
sudo caps2esc &
