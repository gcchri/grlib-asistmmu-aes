library verilog;
use verilog.vl_types.all;
entity OSERDESE2_WRAP is
    generic(
        DATA_RATE_OQ    : string  := "DDR";
        DATA_RATE_TQ    : string  := "DDR";
        DATA_WIDTH      : integer := 4;
        INIT_OQ         : string  := "0";
        INIT_TQ         : string  := "0";
        SERDES_MODE     : string  := "MASTER";
        SRVAL_OQ        : string  := "0";
        SRVAL_TQ        : string  := "0";
        TBYTE_CTL       : string  := "FALSE";
        TBYTE_SRC       : string  := "FALSE";
        TRISTATE_WIDTH  : integer := 4
    );
    port(
        OFB             : out    vl_logic;
        OQ              : out    vl_logic;
        SHIFTOUT1       : out    vl_logic;
        SHIFTOUT2       : out    vl_logic;
        TBYTEOUT        : out    vl_logic;
        TFB             : out    vl_logic;
        TQ              : out    vl_logic;
        CLK             : in     vl_logic;
        CLKDIV          : in     vl_logic;
        D1              : in     vl_logic;
        D2              : in     vl_logic;
        D3              : in     vl_logic;
        D4              : in     vl_logic;
        D5              : in     vl_logic;
        D6              : in     vl_logic;
        D7              : in     vl_logic;
        D8              : in     vl_logic;
        OCE             : in     vl_logic;
        RST             : in     vl_logic;
        SHIFTIN1        : in     vl_logic;
        SHIFTIN2        : in     vl_logic;
        T1              : in     vl_logic;
        T2              : in     vl_logic;
        T3              : in     vl_logic;
        T4              : in     vl_logic;
        TBYTEIN         : in     vl_logic;
        TCE             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_RATE_OQ : constant is 1;
    attribute mti_svvh_generic_type of DATA_RATE_TQ : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 2;
    attribute mti_svvh_generic_type of INIT_OQ : constant is 1;
    attribute mti_svvh_generic_type of INIT_TQ : constant is 1;
    attribute mti_svvh_generic_type of SERDES_MODE : constant is 1;
    attribute mti_svvh_generic_type of SRVAL_OQ : constant is 1;
    attribute mti_svvh_generic_type of SRVAL_TQ : constant is 1;
    attribute mti_svvh_generic_type of TBYTE_CTL : constant is 1;
    attribute mti_svvh_generic_type of TBYTE_SRC : constant is 1;
    attribute mti_svvh_generic_type of TRISTATE_WIDTH : constant is 2;
end OSERDESE2_WRAP;
