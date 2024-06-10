#!/bin/bash

# Create a directory for tools
TOOLS_DIR=~/tools
mkdir -p $TOOLS_DIR

# Function to install Go
install_go() {
    wget https://dl.google.com/go/go1.16.5.linux-amd64.tar.gz
    tar -xvf go1.16.5.linux-amd64.tar.gz
    sudo mv go /usr/local
    echo "export GOROOT=/usr/local/go" >> ~/.bashrc
    echo "export GOPATH=$HOME/go" >> ~/.bashrc
    echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.bashrc
    source ~/.bashrc
}

# Install Go if not already installed
if ! command -v go &> /dev/null
then
    install_go
fi

# Clone and install tools
cd $TOOLS_DIR

# subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# nmap
sudo apt-get install -y nmap

# vulners
git clone https://github.com/vulnersCom/nmap-vulners.git

# GetJS
go install github.com/003random/getJS@latest

# GoLinkFinder
git clone https://github.com/0xsha/GoLinkFinder.git

# getallurls
go install github.com/lc/gau/v2/cmd/gau@latest

# WayBackUrls
go install github.com/tomnomnom/waybackurls@latest

# WayBackRobots
git clone https://github.com/harleo/waybackrobots.git

# MassDNS
git clone https://github.com/blechschmidt/massdns.git && cd massdns && make

# Sublist3r
git clone https://github.com/aboul3la/Sublist3r.git && cd Sublist3r && pip install -r requirements.txt

# FFuF
go install github.com/ffuf/ffuf@latest

# XSSHunter
git clone https://github.com/mandatoryprogrammer/xsshunter_client.git

# SQLMap
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev

# XXEInjector
git clone https://github.com/enjoiz/XXEinjector.git

# SSRFDetector
git clone https://github.com/random-robbie/ssrf-toolkit.git

# GitTools
git clone https://github.com/internetwache/GitTools.git

# gitallsecrets
git clone https://github.com/anshumanbh/git-all-secrets.git

# RaceTheWeb
git clone https://github.com/insp3ctre/racetheweb.git

# CORStest
git clone https://github.com/RUB-NDS/CORStest.git

# EyeWitness
git clone https://github.com/FortyNorthSecurity/EyeWitness.git && cd EyeWitness/Python/setup && sudo ./setup.sh

# parameth
git clone https://github.com/maK-/parameth.git

# Add other necessary installations or updates here

# Return to the home directory
cd ~
