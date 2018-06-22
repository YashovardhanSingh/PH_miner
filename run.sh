#!/usr/bin/env bash
export PYTHONPATH=$PYTHONPATH:.:./ph_py/:./scraper
python ph_miner.py $1
# check the exit code of the mining process
# anything != 0 is error
exit_code=$?
DONE_FILE="./done.txt"
ERRORED_FILE="./errored.txt"
DATE=`date '+%Y-%m-%d %H:%M:%S'`
if [ "$exit_code" -ne 0 ]; then
    cat "$DATE" >> "$ERRORED_FILE"
else
    cat "$DATE" >> "$DONE_FILE"
fi
# for safety, kill chromedriver and google-chrome dangling processes
killall -9 chrome > /dev/null
killall -9 chromdriver > /dev/null
