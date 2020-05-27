#!/bin/sh

# 
# PlanAhead(TM)
# runme.sh: a PlanAhead-generated Runs Script for UNIX
# Copyright 1986-1999, 2001-2012 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=C:/Xilinx/14.4/ISE_DS/EDK/bin/nt64;C:/Xilinx/14.4/ISE_DS/EDK/lib/nt64;C:/Xilinx/14.4/ISE_DS/ISE/bin/nt64;C:/Xilinx/14.4/ISE_DS/ISE/lib/nt64;C:/Xilinx/14.4/ISE_DS/common/bin/nt64;C:/Xilinx/14.4/ISE_DS/common/lib/nt64:C:/Xilinx/14.4/ISE_DS/PlanAhead/bin
else
  PATH=C:/Xilinx/14.4/ISE_DS/EDK/bin/nt64;C:/Xilinx/14.4/ISE_DS/EDK/lib/nt64;C:/Xilinx/14.4/ISE_DS/ISE/bin/nt64;C:/Xilinx/14.4/ISE_DS/ISE/lib/nt64;C:/Xilinx/14.4/ISE_DS/common/bin/nt64;C:/Xilinx/14.4/ISE_DS/common/lib/nt64:C:/Xilinx/14.4/ISE_DS/PlanAhead/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD=`dirname "$0"`
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep ngdbuild -intstyle ise -p xc6vlx240tff1156-1 -dd _ngo -uc "leon3mp.ucf" "leon3mp.edf"
EAStep map -intstyle pa -w -pr b -timing -logic_opt on -register_duplication -ol high -xe n "leon3mp.ngd"
EAStep par -intstyle pa "leon3mp.ncd" -w "leon3mp_routed.ncd" -ol high -xe n
EAStep trce -intstyle ise -o "leon3mp.twr" -v 30 -l 30 "leon3mp_routed.ncd" "leon3mp.pcf"
EAStep xdl -secure -ncd2xdl -nopips "leon3mp_routed.ncd" "leon3mp_routed.xdl"
EAStep bitgen "leon3mp_routed.ncd" "leon3mp.bit" "leon3mp.pcf" -m -w -intstyle pa
