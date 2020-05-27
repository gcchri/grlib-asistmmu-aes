::!/bin/csh -f
::*****************************************************************************
:: (c) Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
::
:: This file contains confidential and proprietary information
:: of Xilinx, Inc. and is protected under U.S. and
:: international copyright and other intellectual property
:: laws.
::
:: DISCLAIMER
:: This disclaimer is not a license and does not grant any
:: rights to the materials distributed herewith. Except as
:: otherwise provided in a valid license issued to you by
:: Xilinx, and to the maximum extent permitted by applicable
:: law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
:: WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
:: AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
:: BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
:: INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
:: (2) Xilinx shall not be liable (whether in contract or tort,
:: including negligence, or under any other theory of
:: liability) for any loss or damage of any kind or nature
:: related to, arising under or in connection with these
:: materials, including for any direct, or any indirect,
:: special, incidental, or consequential loss or damage
:: (including loss of data, profits, goodwill, or any type of
:: loss or damage suffered as a result of any action brought
:: by a third party) even if such damage or loss was
:: reasonably foreseeable or Xilinx had been advised of the
:: possibility of the same.
::
:: CRITICAL APPLICATIONS
:: Xilinx products are not designed or intended to be fail-
:: safe, or for use in any application requiring fail-safe
:: performance, such as life-support or safety devices or
:: systems, Class III medical devices, nuclear facilities,
:: applications related to the deployment of airbags, or any
:: other applications that could lead to death, personal
:: injury, or severe property or environmental damage
:: (individually and collectively, "Critical
:: Applications"). Customer assumes the sole risk and
:: liability of any use of Xilinx products in Critical
:: Applications, subject only to applicable laws and
:: regulations governing limitations on product liability.
::
:: THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
:: PART OF THIS FILE AT ALL TIMES.
::
:: ****************************************************************************
::   ____  ____
::  /   /\/   /
:: /___/  \  /    Vendor                : Xilinx
:: \   \   \/     Version               : 3.92
::  \   \         Application           : MIG
::  /   /         Filename              : ise_flow.bat
:: /___/   /\     Date Last Modified    : Mon Jul 20 2009
:: \   \  /  \    Date Created          : Fri Feb 06 2009
::  \___\/\___\
::
:: Device            : Virtex-6
:: Design Name       : DDR3 SDRAM
:: Purpose           : Batch file to run Synthesis through Synplify Pro and PAR through ISE in batch mode
:: Reference         :
:: Revision History  :
:: ****************************************************************************

call rem_files.bat

::coregen -b makeproj.bat
::coregen -p . -b icon5_cg.xco
::coregen -p . -b ila384_8_cg.xco
::coregen -p . -b vio_async_in256_cg.xco
::coregen -p . -b vio_sync_out32_cg.xco

echo Synthesis Tool: Synplicity

synplify_pro -batch ../synth/synplify_pro.tcl > ise_flow_results.txt
ngdbuild -nt timestamp -uc mig.ucf -p xc6vlx240t-ff1156-1 ../synth/rev_1/mig.edf mig.ngd >> ise_flow_results.txt

echo Implementation Tool: ISE
map -intstyle ise -p xc6vlx240t-ff1156-1 -w -ol high -xe n -register_duplication off -global_opt off -ir off -pr off -lc off -power off -o mig_map.ncd mig.ngd mig.pcf >> ise_flow_results.txt
par -w -intstyle ise -ol high -xe n mig_map.ncd mig.ncd mig.pcf >> ise_flow_results.txt
trce -intstyle ise -v 3 -fastpaths -xml mig mig.ncd -o mig.twr mig.pcf >> ise_flow_results.txt
bitgen -intstyle ise -f bitgen_options.ut mig.ncd >> ise_flow_results.txt
echo done!
