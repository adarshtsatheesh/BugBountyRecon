#!/bin/bash

# Define the domain as an argument
DOMAIN=$1
TOOLS_DIR=~/tools

# Run Subfinder
subfinder -d $DOMAIN -o $TOOLS_DIR/subfinder_results.txt

# Run dirsearch
python3 $TOOLS_DIR/dirsearch/dirsearch.py -u $DOMAIN -e *

# Run nmap with vulners
nmap -sV --script nmap-vulners -oN $TOOLS_DIR/nmap_results.txt $DOMAIN

# Run GetJS
getJS --url $DOMAIN --output $TOOLS_DIR/getJS_results.txt

# Run GoLinkFinder
python3 $TOOLS_DIR/GoLinkFinder/golinkfinder.py -u $DOMAIN -o $TOOLS_DIR/golinkfinder_results.txt

# Run getallurls (GAU)
gau $DOMAIN | tee $TOOLS_DIR/gau_results.txt

# Run WayBackUrls
echo $DOMAIN | waybackurls | tee $TOOLS_DIR/waybackurls_results.txt

# Run WayBackRobots
python3 $TOOLS_DIR/waybackrobots/waybackrobots.py -u $DOMAIN -o $TOOLS_DIR/waybackrobots_results.txt

# Run MassDNS
$TOOLS_DIR/massdns/bin/massdns -r $TOOLS_DIR/massdns/lists/resolvers.txt -o S -w $TOOLS_DIR/massdns_results.txt $DOMAIN

# Run Sublist3r
python3 $TOOLS_DIR/Sublist3r/sublist3r.py -d $DOMAIN -o $TOOLS_DIR/sublister_results.txt

# Run FFuF
ffuf -u $DOMAIN/FUZZ -w /path/to/wordlist -o $TOOLS_DIR/ffuf_results.txt

# Run XSSHunter (if applicable setup is done)

# Run SQLMap
python3 $TOOLS_DIR/sqlmap-dev/sqlmap.py -u $DOMAIN --batch --output-dir=$TOOLS_DIR/sqlmap_results

# Run XXEInjector
python3 $TOOLS_DIR/XXEinjector/xxeinjector.py -u $DOMAIN -o $TOOLS_DIR/xxe_results.txt

# Run SSRFDetector
python3 $TOOLS_DIR/ssrf-toolkit/ssrf_detector.py $DOMAIN | tee $TOOLS_DIR/ssrf_results.txt

# Run GitTools (appropriate git repo needs to be specified)
# $TOOLS_DIR/GitTools/Dumper/gitdumper.sh <git-url> $TOOLS_DIR/gittools_results

# Run git-all-secrets (setup required)

# Run RaceTheWeb
python3 $TOOLS_DIR/racetheweb/racetheweb.py -u $DOMAIN -o $TOOLS_DIR/racetheweb_results.txt

# Run CORStest
python3 $TOOLS_DIR/CORStest/corstest.py $DOMAIN | tee $TOOLS_DIR/corstest_results.txt

# Run EyeWitness
python3 $TOOLS_DIR/EyeWitness/EyeWitness.py --web --headless -f $TOOLS_DIR/waybackurls_results.txt --no-prompt -d $TOOLS_DIR/eyewitness_results

# Run parameth
python3 $TOOLS_DIR/parameth/parameth.py -u $DOMAIN | tee $TOOLS_DIR/parameth_results.txt

# Add any other tool runs or processes here

# Output complete message
echo "Recon process for $DOMAIN completed. Results saved in $TOOLS_DIR"
