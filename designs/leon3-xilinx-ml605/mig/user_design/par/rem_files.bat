::****************************************************************************
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
::****************************************************************************
::   ____  ____
::  /   /\/   /
:: /___/  \  /    Vendor                : Xilinx
:: \   \   \/     Version               : 3.92
::  \   \         Application           : MIG
::  /   /         Filename              : rem_files.bat
:: /___/   /\     Date Last Modified    : Mon Jul 20 2009
:: \   \  /  \    Date Created          : Fri Feb 06 2009
::  \___\/\___\
::
:: Device            : Virtex-6
:: Design Name       : DDR3 SDRAM
:: Purpose           : Batch file to remove files generated from ISE
:: Reference         :
:: Revision History  :
::****************************************************************************

@echo off
IF EXIST "../synth/rev_1" rmdir /S /Q "../synth/rev_1"

IF EXIST tmp rmdir /S /Q tmp
IF EXIST _xmsgs rmdir /S /Q _xmsgs

IF EXIST xst rmdir /S /Q xst
IF EXIST xlnx_auto_0_xdb rmdir /S /Q xlnx_auto_0_xdb

IF EXIST coregen.cgc del /F /Q coregen.cgc
IF EXIST coregen.cgp del /F /Q coregen.cgp
IF EXIST coregen.log del /F /Q coregen.log
IF EXIST stdout.log del /F /Q stdout.log

IF EXIST ise_flow_results.txt del /F /Q ise_flow_results.txt
IF EXIST mig_vhdl.prj del /F /Q mig_vhdl.prj
IF EXIST mig.syr del /F /Q mig.syr
IF EXIST mig.ngc del /F /Q mig.ngc
IF EXIST mig.ngr del /F /Q mig.ngr
IF EXIST mig_xst.xrpt del /F /Q mig_xst.xrpt
IF EXIST mig.bld del /F /Q mig.bld
IF EXIST mig.ngd del /F /Q mig.ngd
IF EXIST mig_ngdbuild.xrpt del /F /Q  mig_ngdbuild.xrpt
IF EXIST mig_map.map del /F /Q  mig_map.map
IF EXIST mig_map.mrp del /F /Q  mig_map.mrp
IF EXIST mig_map.ngm del /F /Q  mig_map.ngm
IF EXIST mig.pcf del /F /Q  mig.pcf
IF EXIST mig_map.ncd del /F /Q  mig_map.ncd
IF EXIST mig_map.xrpt del /F /Q  mig_map.xrpt
IF EXIST mig_summary.xml del /F /Q  mig_summary.xml
IF EXIST mig_usage.xml del /F /Q  mig_usage.xml
IF EXIST mig.ncd del /F /Q  mig.ncd
IF EXIST mig.par del /F /Q  mig.par
IF EXIST mig.xpi del /F /Q  mig.xpi
IF EXIST smartpreview.twr del /F /Q  smartpreview.twr
IF EXIST mig.ptwx del /F /Q  mig.ptwx
IF EXIST mig.pad del /F /Q  mig.pad
IF EXIST mig.unroutes del /F /Q  mig.unroutes
IF EXIST mig_pad.csv del /F /Q  mig_pad.csv
IF EXIST mig_pad.txt del /F /Q  mig_pad.txt
IF EXIST mig_par.xrpt del /F /Q  mig_par.xrpt
IF EXIST mig.twx del /F /Q  mig.twx
IF EXIST mig.bgn del /F /Q  mig.bgn
IF EXIST mig.twr del /F /Q  mig.twr
IF EXIST mig.drc del /F /Q  mig.drc
IF EXIST mig_bitgen.xwbt del /F /Q  mig_bitgen.xwbt
IF EXIST mig.bit del /F /Q  mig.bit
IF EXIST mig.ngo del mig.ngo
IF EXIST proj_1.prd del proj_1.prd
IF EXIST proj_1.prj del proj_1.prj
IF EXIST netlist.lst del netlist.lst

:: Files and folders generated Coregen ChipScope Modules
IF EXIST icon5.asy del icon5.asy
IF EXIST icon5.ngc del icon5.ngc
IF EXIST icon5.xco del icon5.xco
IF EXIST icon5_xmdf.tcl del icon5_xmdf.tcl
IF EXIST icon5.gise del icon5.gise
IF EXIST icon5.ise del icon5.ise
IF EXIST icon5.xise del icon5.xise
IF EXIST icon5_flist.txt del icon5_flist.txt
IF EXIST icon5_readme.txt del icon5_readme.txt
IF EXIST icon5.cdc del icon5.cdc
IF EXIST icon5_xdb rmdir /S /Q icon5_xdb

IF EXIST ila384_8.asy del ila384_8.asy
IF EXIST ila384_8.ngc del ila384_8.ngc
IF EXIST ila384_8.xco del ila384_8.xco
IF EXIST ila384_8_xmdf.tcl del ila384_8_xmdf.tcl
IF EXIST ila384_8.gise del ila384_8.gise
IF EXIST ila384_8.ise del ila384_8.ise
IF EXIST ila384_8.xise del ila384_8.xise
IF EXIST ila384_8_flist.txt del ila384_8_flist.txt
IF EXIST ila384_8_readme.txt del ila384_8_readme.txt
IF EXIST ila384_8.cdc del ila384_8.cdc
IF EXIST ila384_8_xdb rmdir /S /Q ila384_8_xdb

IF EXIST vio_async_in256.asy del vio_async_in256.asy
IF EXIST vio_async_in256.ngc del vio_async_in256.ngc
IF EXIST vio_async_in256.xco del vio_async_in256.xco
IF EXIST vio_async_in256_xmdf.tcl del vio_async_in256_xmdf.tcl
IF EXIST vio_async_in256.gise del vio_async_in256.gise
IF EXIST vio_async_in256.ise del vio_async_in256.ise
IF EXIST vio_async_in256.xise del vio_async_in256.xise
IF EXIST vio_async_in256_flist.txt del vio_async_in256_flist.txt
IF EXIST vio_async_in256_readme.txt del vio_async_in256_readme.txt
IF EXIST vio_async_in256.cdc del vio_async_in256.cdc
IF EXIST vio_async_in256_xdb rmdir /S /Q vio_async_in256_xdb

IF EXIST vio_sync_out32.asy del vio_sync_out32.asy
IF EXIST vio_sync_out32.ngc del vio_sync_out32.ngc
IF EXIST vio_sync_out32.xco del vio_sync_out32.xco
IF EXIST vio_sync_out32_xmdf.tcl del vio_sync_out32_xmdf.tcl
IF EXIST vio_sync_out32.gise del vio_sync_out32.gise
IF EXIST vio_sync_out32.ise del vio_sync_out32.ise
IF EXIST vio_sync_out32.xise del vio_sync_out32.xise
IF EXIST vio_sync_out32_flist.txt del vio_sync_out32_flist.txt
IF EXIST vio_sync_out32_readme.txt del vio_sync_out32_readme.txt
IF EXIST vio_sync_out32.cdc del vio_sync_out32.cdc
IF EXIST vio_sync_out32_xdb rmdir /S /Q vio_sync_out32_xdb

:: Files and folders generated by create ise
IF EXIST test_xdb rmdir /S /Q test_xdb
IF EXIST _xmsgs rmdir /S /Q _xmsgs
IF EXIST test.gise del /F /Q test.gise
IF EXIST test.xise del /F /Q test.xise
IF EXIST test.xise del /F /Q test.xise

:: Files and folders generated by ISE through GUI mode
IF EXIST _ngo rmdir /S /Q _ngo
IF EXIST xst rmdir /S /Q xst
IF EXIST mig.cmd_log del /F /Q mig.cmd_log
IF EXIST mig.lso del /F /Q mig.lso
IF EXIST mig.prj del /F /Q mig.prj
IF EXIST mig.stx del /F /Q mig.stx
IF EXIST mig.ut del /F /Q mig.ut
IF EXIST mig.xst del /F /Q mig.xst
IF EXIST mig_guide.ncd del /F /Q mig_guide.ncd
IF EXIST mig_prev_built.ngd del /F /Q mig_prev_built.ngd
IF EXIST mig_summary.html del /F /Q mig_summary.html
IF EXIST par_usage_statistics.html del /F /Q par_usage_statistics.html
IF EXIST usage_statistics_webtalk.html del /F /Q usage_statistics_webtalk.html
IF EXIST webtalk.log del /F /Q webtalk.log
IF EXIST device_usage_statistics.html del /F /Q device_usage_statistics.html
IF EXIST test.ntrc_log del /F /Q test.ntrc_log

@echo on
