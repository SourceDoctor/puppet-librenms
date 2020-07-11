#!/bin/bash
#######################################
# please read DOCS to succesfully get #
# raspberry sensors into your host    #
#######################################
picmd='/usr/bin/vcgencmd'
pised='/bin/sed'
getTemp='measure_temp'
getVoltsCore='measure_volts core'
getVoltsRamC='measure_volts sdram_c'
getVoltsRamI='measure_volts sdram_i'
getVoltsRamP='measure_volts sdram_p'
getFreqArm='measure_clock arm'
getFreqCore='measure_clock core'
getStatusH264='codec_enabled H264'
getStatusMPG2='codec_enabled MPG2'
getStatusWVC1='codec_enabled WVC1'
getStatusMPG4='codec_enabled MPG4'
getStatusMJPG='codec_enabled MJPG'
getStatusWMV9='codec_enabled WMV9'

$picmd $getTemp | $pised 's|[^0-9.]||g'
$picmd $getVoltsCore | $pised 's|[^0-9.]||g'
$picmd $getVoltsRamC | $pised 's|[^0-9.]||g'
$picmd $getVoltsRamI | $pised 's|[^0-9.]||g'
$picmd $getVoltsRamP | $pised 's|[^0-9.]||g'
$picmd $getFreqArm  | $pised 's/frequency(45)=//g'
$picmd $getFreqCore | $pised 's/frequency(1)=//g'
$picmd $getStatusH264 | $pised 's/H264=//g'
$picmd $getStatusMPG2 | $pised 's/MPG2=//g'
$picmd $getStatusWVC1 | $pised 's/WVC1=//g'
$picmd $getStatusMPG4 | $pised 's/MPG4=//g'
$picmd $getStatusMJPG | $pised 's/MJPG=//g'
$picmd $getStatusWMV9 | $pised 's/WMV9=//g'
$picmd $getStatusH264 | $pised 's/enabled/2/g'
$picmd $getStatusMPG2 | $pised 's/enabled/2/g'
$picmd $getStatusWVC1 | $pised 's/enabled/2/g'
$picmd $getStatusMPG4 | $pised 's/enabled/2/g'
$picmd $getStatusMJPG | $pised 's/enabled/2/g'
$picmd $getStatusWMV9 | $pised 's/enabled/2/g'
$picmd $getStatusH264 | $pised 's/disabled/1/g'
$picmd $getStatusMPG2 | $pised 's/disabled/1/g'
$picmd $getStatusWVC1 | $pised 's/disabled/1/g'
$picmd $getStatusMPG4 | $pised 's/disabled/1/g'
$picmd $getStatusMJPG | $pised 's/disabled/1/g'
$picmd $getStatusWMV9 | $pised 's/disabled/1/g'