#!/bin/bash

# Clear the screen
clear

# Start Tor service if not running and display a custom message
if ! pgrep -x "tor" > /dev/null
then
    echo "Connecting to Tor network...."
    # ASCII art spinner (simple example)
    while :; do
        for s in / - \\ \|; do
            printf "\r$s";
            sleep 0.2;
        done
    done &
    spinner_pid=$!
    disown

    # Start Tor and suppress its logs
    tor > /dev/null 2>&1 &
    sleep 30  # Give time for Tor to start

    # Kill the spinner
    kill $spinner_pid
    wait $spinner_pid 2>/dev/null
fi

# Use torsocks to torify the shell
# Make sure torsocks is installed and configured properly
use_with_tor() {
    torsocks "$@"
}
# Clear the screen again
clear

# Custom message using figlet
figlet -t -f "Bloody" "Darkseeker"

# Custom message after Tor is connected
echo "Please select your destination:"
echo "1: Torgle"
echo "2: Onion Search Engine"
echo "3: Torch"
echo "4: TorBook"
echo "5: SenTor"
echo "6: Haystak"
echo "7: Submarine"
echo "8: Onion Search Server"
echo "9: TOR Search Engine"
echo "10: TORnet Global Search"

# ... other options

read -p "Enter your choice: " choice

# Open the selected website with w3m
case $choice in
    1) use_with_tor w3m http://iy3544gmoeclh5de6gez2256v6pjh4omhpqdh2wpeeppjtvqmjhkfwad.onion/torgle/;;
    2) use_with_tor w3m http://kn3hl4xwon63tc6hpjrwza2npb7d4w5yhbzq7jjewpfzyhsd65tm6dad.onion/;;
    3) use_with_tor w3m http://xmh57jrknzkhv6y3ls3ubitzfqnkrwxhopf5aygthi7d6rplyvk3noyd.onion/cgi-bin/omega/omega;;
    4) use_with_tor w3m http://torbookp6ougjm42lzt4gzki3ozprktiekhqydwavp26d5m3ewjr3fad.onion/;;
    5) use_with_tor w3m http://e27slbec2ykiyo26gfuovaehuzsydffbit5nlxid53kigw3pvz6uosqd.onion/;;
    6) use_with_tor w3m http://haystak5njsmn2hqkewecpaxetahtwhsbsa64jom2k22z5afxhnpxfid.onion/;;
    7) use_with_tor w3m http://no6m4wzdexe3auiupv2zwif7rm6qwxcyhslkcnzisxgeiw6pvjsgafad.onion/;;
    8) use_with_tor w3m http://3fzh7yuupdfyjhwt3ugzqqof6ulbcl27ecev33knxe3u7goi3vfn2qqd.onion/oss/;;
    9) use_with_tor w3m http://searchesqafmar2ocusr443hnolhmrxek5xu3hrw3wliwlzmdywvjtqd.onion/;;
    10) use_with_tor w3m http://xcprh4cjas33jnxgs3zhakof6mctilfxigwjcsevdfap7vtyj57lmjad.onion/tgs/;;
    *) echo "Invalid choice";;
esac
