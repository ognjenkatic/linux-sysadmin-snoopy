#!/bin/bash

CITY="Banjaluka"
API_KEY=""
URL="https://api.openweathermap.org/data/2.5/forecast?q=${CITY}&APPID=${API_KEY}&units=metric"

JSON=$(curl "${URL}")
JSONC="`echo $JSON | jq .list | jq .[0]`"
JSONS="`echo $JSON | jq .list | jq .[1]`"
JSONT="`echo $JSON | jq .list | jq .[2]`"

ICONC="`echo $JSONC | jq -r '.weather | .[0] | .icon'`.png"
ICONS="`echo $JSONS | jq -r '.weather | .[0] | .icon'`.png"
ICONT="`echo $JSONT | jq -r '.weather | .[0] | .icon'`.png"

TEMPC="`echo $JSONC | jq -r '.main | .temp'`"
TEMPS="`echo $JSONS | jq -r '.main | .temp'`"
TEMPT="`echo $JSONT | jq -r '.main | .temp'`"

DTC="`echo $JSONC | jq -r .dt `"
DTS="`echo $JSONS | jq -r .dt `"
DTT="`echo $JSONT | jq -r .dt `"

TIMEC=`date +'%d.%m %H:%M' -d @$DTC`
TIMES=`date +'%d.%m %H:%M' -d @$DTS`
TIMET=`date +'%d.%m %H:%M' -d @$DTT`


echo "$TEMPC,$TEMPS,$TEMPT,$TIMEC,$TIMES,$TIMET" > ~/.conky/snoopy/Scripts/weather.csv
ln -fs ~/.conky/snoopy/Images/$ICONC ~/.conky/snoopy/Images/cw_icon.png
ln -fs ~/.conky/snoopy/Images/$ICONS ~/.conky/snoopy/Images/sw_icon.png
ln -fs ~/.conky/snoopy/Images/$ICONT ~/.conky/snoopy/Images/tw_icon.png