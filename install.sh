#!/bin/bash

clear
# Function to display a spinner
spinner() {
  local pid=$!
  local delay=0.1
  local spin_chars=("⋮" "⋰" "⋯" "⋱")

  while kill -0 $pid >/dev/null 2>&1; do
    for char in "${spin_chars[@]}"; do
      echo -n -e "\r$char Please wait... Installing..."
      sleep $delay
    done
  done

  echo -e "\r DARKSEEKER LURKING ..... SUCCESS! [✔] "
}

# Install dependencies silently
# Check for Termux or Linux
if [[ $PREFIX = "/data/data/com.termux/files/usr" ]]; then
  # Use pkg installer
  pkg up -y >/dev/null 2>&1 &
    spinner
  apt autoremove -y >/dev/null 2>&1 &
    spinner
  apt autoclean >/dev/null 2>&1 &
    spinner
  pkg install -y tor torsocks w3m >/dev/null 2>&1 &
    spinner
  pkg uninstall figlet >/dev/null 2>&1 &
    spinner
  rm /data/data/com.termux/files/usr/share/figlet -rf >/dev/null 2>&1 &
    spinner
  git clone https://github.com/chameleonhash/figlet /data/data/com.termux/files/usr/share/figlet >/dev/null 2>&1 &
    spinner
  pkg install -y figlet >/dev/null 2>&1 &
    spinner

else
  sudo apt update >/dev/null 2>&1 &
    spinner
  sudo apt upgrade -y >/dev/null 2>&1 &
    spinner
  sudo apt autoremove -y >/dev/null 2>&1 &
    spinner
  sudo apt autoclean >/dev/null 2>&1 &
    spinner
  sudo apt-get install -y tor torsocks w3m >/dev/null 2>&1 &
    spinner
  sudo apt-get remove -y figlet >/dev/null 2>&1 &
    spinner
  sudo rm /usr/share/figlet -rf >/dev/null 2>&1 &
    spinner
  git clone https://github.com/chameleonhash/figlet /usr/share/figlet >/dev/null 2>&1 &
    spinner
  sudo apt-get install figlet -y >/dev/null 2>&1 &
    spinner
fi
