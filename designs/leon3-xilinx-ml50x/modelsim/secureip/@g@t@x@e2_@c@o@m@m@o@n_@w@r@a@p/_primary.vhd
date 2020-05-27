library verilog;
use verilog.vl_types.all;
entity GTXE2_COMMON_WRAP is
    generic(
        BIAS_CFG        : string  := "0000040000001000";
        COMMON_CFG      : string  := "00000000";
        QPLL_CFG        : string  := "0680181";
        QPLL_CLKOUT_CFG : string  := "0000";
        QPLL_COARSE_FREQ_OVRD: string  := "010000";
        QPLL_COARSE_FREQ_OVRD_EN: string  := "0";
        QPLL_CP         : string  := "0000011111";
        QPLL_CP_MONITOR_EN: string  := "0";
        QPLL_DMONITOR_SEL: string  := "0";
        QPLL_FBDIV      : string  := "0000000000";
        QPLL_FBDIV_MONITOR_EN: string  := "0";
        QPLL_FBDIV_RATIO: string  := "0";
        QPLL_INIT_CFG   : string  := "000006";
        QPLL_LOCK_CFG   : string  := "21E8";
        QPLL_LPF        : string  := "1111";
        QPLL_REFCLK_DIV : integer := 2;
        SIM_QPLLREFCLK_SEL: string  := "001";
        SIM_RESET_SPEEDUP: string  := "TRUE";
        SIM_VERSION     : string  := "3.0"
    );
    port(
        DRPDO           : out    vl_logic_vector(15 downto 0);
        DRPRDY          : out    vl_logic;
        QPLLDMONITOR    : out    vl_logic_vector(7 downto 0);
        QPLLFBCLKLOST   : out    vl_logic;
        QPLLLOCK        : out    vl_logic;
        QPLLOUTCLK      : out    vl_logic;
        QPLLOUTREFCLK   : out    vl_logic;
        QPLLREFCLKLOST  : out    vl_logic;
        REFCLKOUTMONITOR: out    vl_logic;
        BGBYPASSB       : in     vl_logic;
        BGMONITORENB    : in     vl_logic;
        BGPDB           : in     vl_logic;
        BGRCALOVRD      : in     vl_logic_vector(4 downto 0);
        DRPADDR         : in     vl_logic_vector(7 downto 0);
        DRPCLK          : in     vl_logic;
        DRPDI           : in     vl_logic_vector(15 downto 0);
        DRPEN           : in     vl_logic;
        DRPWE           : in     vl_logic;
        GTGREFCLK       : in     vl_logic;
        GTNORTHREFCLK0  : in     vl_logic;
        GTNORTHREFCLK1  : in     vl_logic;
        GTREFCLK0       : in     vl_logic;
        GTREFCLK1       : in     vl_logic;
        GTSOUTHREFCLK0  : in     vl_logic;
        GTSOUTHREFCLK1  : in     vl_logic;
        PMARSVD         : in     vl_logic_vector(7 downto 0);
        QPLLLOCKDETCLK  : in     vl_logic;
        QPLLLOCKEN      : in     vl_logic;
        QPLLOUTRESET    : in     vl_logic;
        QPLLPD          : in     vl_logic;
        QPLLREFCLKSEL   : in     vl_logic_vector(2 downto 0);
        QPLLRESET       : in     vl_logic;
        QPLLRSVD1       : in     vl_logic_vector(15 downto 0);
        QPLLRSVD2       : in     vl_logic_vector(4 downto 0);
        RCALENB         : in     vl_logic;
        GSR             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BIAS_CFG : constant is 1;
    attribute mti_svvh_generic_type of COMMON_CFG : constant is 1;
    attribute mti_svvh_generic_type of QPLL_CFG : constant is 1;
    attribute mti_svvh_generic_type of QPLL_CLKOUT_CFG : constant is 1;
    attribute mti_svvh_generic_type of QPLL_COARSE_FREQ_OVRD : constant is 1;
    attribute mti_svvh_generic_type of QPLL_COARSE_FREQ_OVRD_EN : constant is 1;
    attribute mti_svvh_generic_type of QPLL_CP : constant is 1;
    attribute mti_svvh_generic_type of QPLL_CP_MONITOR_EN : constant is 1;
    attribute mti_svvh_generic_type of QPLL_DMONITOR_SEL : constant is 1;
    attribute mti_svvh_generic_type of QPLL_FBDIV : constant is 1;
    attribute mti_svvh_generic_type of QPLL_FBDIV_MONITOR_EN : constant is 1;
    attribute mti_svvh_generic_type of QPLL_FBDIV_RATIO : constant is 1;
    attribute mti_svvh_generic_type of QPLL_INIT_CFG : constant is 1;
    attribute mti_svvh_generic_type of QPLL_LOCK_CFG : constant is 1;
    attribute mti_svvh_generic_type of QPLL_LPF : constant is 1;
    attribute mti_svvh_generic_type of QPLL_REFCLK_DIV : constant is 2;
    attribute mti_svvh_generic_type of SIM_QPLLREFCLK_SEL : constant is 1;
    attribute mti_svvh_generic_type of SIM_RESET_SPEEDUP : constant is 1;
    attribute mti_svvh_generic_type of SIM_VERSION : constant is 1;
end GTXE2_COMMON_WRAP;
