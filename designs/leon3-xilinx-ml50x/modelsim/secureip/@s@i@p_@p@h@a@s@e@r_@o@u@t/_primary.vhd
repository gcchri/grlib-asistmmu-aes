library verilog;
use verilog.vl_types.all;
entity SIP_PHASER_OUT is
    generic(
        REFCLK_PERIOD   : real    := 2.500000e+000
    );
    port(
        CLKOUT_DIV      : in     vl_logic_vector(3 downto 0);
        CLKOUT_DIV_ST   : in     vl_logic_vector(3 downto 0);
        COARSE_BYPASS   : in     vl_logic;
        COARSE_DELAY    : in     vl_logic_vector(5 downto 0);
        CTL_MODE        : in     vl_logic;
        DATA_CTL_N      : in     vl_logic;
        DATA_RD_CYCLES  : in     vl_logic;
        EN_OSERDES_RST  : in     vl_logic;
        EN_TEST_RING    : in     vl_logic;
        FINE_DELAY      : in     vl_logic_vector(5 downto 0);
        OCLK_DELAY      : in     vl_logic_vector(5 downto 0);
        OCLKDELAY_INV   : in     vl_logic;
        OUTPUT_CLK_SRC  : in     vl_logic_vector(1 downto 0);
        PHASER_OUT_EN   : in     vl_logic;
        SYNC_IN_DIV_RST : in     vl_logic;
        CLKOUT_DIV_POS  : in     vl_logic_vector(3 downto 0);
        STG1_BYPASS     : in     vl_logic;
        TEST_OPT        : in     vl_logic_vector(10 downto 0);
        COARSEOVERFLOW  : out    vl_logic;
        COUNTERREADVAL  : out    vl_logic_vector(8 downto 0);
        CTSBUS          : out    vl_logic_vector(1 downto 0);
        DQSBUS          : out    vl_logic_vector(1 downto 0);
        DTSBUS          : out    vl_logic_vector(1 downto 0);
        FINEOVERFLOW    : out    vl_logic;
        OCLK            : out    vl_logic;
        OCLKDELAYED     : out    vl_logic;
        OCLKDIV         : out    vl_logic;
        OSERDESRST      : out    vl_logic;
        RDENABLE        : out    vl_logic;
        SCANOUT         : out    vl_logic;
        TESTOUT         : out    vl_logic_vector(3 downto 0);
        BURSTPENDING    : in     vl_logic;
        BURSTPENDINGPHY : in     vl_logic;
        COARSEENABLE    : in     vl_logic;
        COARSEINC       : in     vl_logic;
        COUNTERLOADEN   : in     vl_logic;
        COUNTERLOADVAL  : in     vl_logic_vector(8 downto 0);
        COUNTERREADEN   : in     vl_logic;
        DIVIDERST       : in     vl_logic;
        EDGEADV         : in     vl_logic;
        ENCALIB         : in     vl_logic_vector(1 downto 0);
        ENCALIBPHY      : in     vl_logic_vector(1 downto 0);
        FINEENABLE      : in     vl_logic;
        FINEINC         : in     vl_logic;
        FREQREFCLK      : in     vl_logic;
        MEMREFCLK       : in     vl_logic;
        PHASEREFCLK     : in     vl_logic;
        RST             : in     vl_logic;
        SCANCLK         : in     vl_logic;
        SCANENB         : in     vl_logic;
        SCANIN          : in     vl_logic;
        SCANMODEB       : in     vl_logic;
        SELFINEOCLKDELAY: in     vl_logic;
        SYNCIN          : in     vl_logic;
        SYSCLK          : in     vl_logic;
        TESTIN          : in     vl_logic_vector(15 downto 0);
        GSR             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of REFCLK_PERIOD : constant is 2;
end SIP_PHASER_OUT;
