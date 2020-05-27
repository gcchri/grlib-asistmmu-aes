
The design files are located at
C:/cygwin64/home/gchri/grlib-gpl-1.3.7-b4144-XOR_TSP-decode/designs/leon3-xilinx-ml605:

   - mig.veo:
        veo template file containing code that can be used as a model
        for instantiating a CORE Generator module in a HDL design.

   - mig.xco:
       CORE Generator input file containing the parameters used to
       regenerate a core.

   - mig_flist.txt:
        Text file listing all of the output files produced when a customized
        core was generated in the CORE Generator.

   - mig_readme.txt:
        Text file indicating the files generated and how they are used.

   - mig_xmdf.tcl:
        ISE Project Navigator interface file. ISE uses this file to determine
        how the files output by CORE Generator for the core can be integrated
        into your ISE project.

   - mig.gise and mig.xise:
        ISE Project Navigator support files. These are generated files and
        should not be edited directly.

   - mig directory.

In the mig directory, three folders are created:
   - docs:
        This folder contains Virtex-6 FPGA Memory Interface Solutions user guide
        and data sheet.

   - example_design:
        This folder includes the design with synthesizable test bench.

   - user_design:
        This folder includes the design without test bench modules.

The example_design and user_design folders contain several other folders
and files. All these output folders are discussed in more detail in
Virtex-6 FPGA Memory Interface Solutions User Guide (UG406) located
in docs folder.
    