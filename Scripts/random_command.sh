#!/bin/bash

LINE_COUNT=$(( $(wc -l < ~/.conky/snoopy/Scripts/commands.csv) - 1 ))
RANDOM_LINE=$(($RANDOM%${LINE_COUNT}+1))

TERM=$(sed "${RANDOM_LINE}q;d" ~/.conky/snoopy/Scripts/commands.csv | cut -d',' -f 1)
DEF=$(sed "${RANDOM_LINE}q;d" ~/.conky/snoopy/Scripts/commands.csv | cut -d',' -f 2)

RET="${TERM} - ${DEF}"
echo "${RET}" | fold -s -w $1