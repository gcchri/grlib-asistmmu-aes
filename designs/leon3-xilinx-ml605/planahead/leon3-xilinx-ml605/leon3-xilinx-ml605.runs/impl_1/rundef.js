//
// PlanAhead(TM)
// rundef.js: a PlanAhead-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-1999, 2001-2012 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "C:/Xilinx/14.4/ISE_DS/EDK/bin/nt64;C:/Xilinx/14.4/ISE_DS/EDK/lib/nt64;C:/Xilinx/14.4/ISE_DS/ISE/bin/nt64;C:/Xilinx/14.4/ISE_DS/ISE/lib/nt64;C:/Xilinx/14.4/ISE_DS/common/bin/nt64;C:/Xilinx/14.4/ISE_DS/common/lib/nt64;C:/Xilinx/14.4/ISE_DS/PlanAhead/bin;";
} else {
  PathVal = "C:/Xilinx/14.4/ISE_DS/EDK/bin/nt64;C:/Xilinx/14.4/ISE_DS/EDK/lib/nt64;C:/Xilinx/14.4/ISE_DS/ISE/bin/nt64;C:/Xilinx/14.4/ISE_DS/ISE/lib/nt64;C:/Xilinx/14.4/ISE_DS/common/bin/nt64;C:/Xilinx/14.4/ISE_DS/common/lib/nt64;C:/Xilinx/14.4/ISE_DS/PlanAhead/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "ngdbuild",
         "-intstyle ise -p xc6vlx240tff1156-1 -dd _ngo -uc \"leon3mp.ucf\" \"leon3mp.edf\"" );
ISEStep( "map",
         "-intstyle pa -w -pr b -timing -logic_opt on -register_duplication -ol high -xe n \"leon3mp.ngd\"" );
ISEStep( "par",
         "-intstyle pa \"leon3mp.ncd\" -w \"leon3mp_routed.ncd\" -ol high -xe n" );
ISEStep( "trce",
         "-intstyle ise -o \"leon3mp.twr\" -v 30 -l 30 \"leon3mp_routed.ncd\" \"leon3mp.pcf\"" );
ISEStep( "xdl",
         "-secure -ncd2xdl -nopips \"leon3mp_routed.ncd\" \"leon3mp_routed.xdl\"" );
ISEStep( "bitgen",
         "\"leon3mp_routed.ncd\" \"leon3mp.bit\" \"leon3mp.pcf\" -m -w -intstyle pa" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
