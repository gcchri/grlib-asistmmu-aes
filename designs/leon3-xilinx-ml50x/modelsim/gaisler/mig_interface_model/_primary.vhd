library verilog;
use verilog.vl_types.all;
entity mig_interface_model is
    generic(
        AddressSize     : integer := 20;
        WordSize        : integer := 512;
        MEM_SIZE        : vl_notype
    );
    port(
        app_addr        : in     vl_logic_vector(27 downto 0);
        app_cmd         : in     vl_logic_vector(2 downto 0);
        app_en          : in     vl_logic;
        app_wdf_data    : in     vl_logic_vector(511 downto 0);
        app_wdf_end     : in     vl_logic;
        app_wdf_mask    : in     vl_logic_vector(63 downto 0);
        app_wdf_wren    : in     vl_logic;
        app_rd_data     : out    vl_logic_vector(511 downto 0);
        app_rd_data_end : out    vl_logic;
        app_rd_data_valid: out    vl_logic;
        app_rdy         : out    vl_logic;
        app_wdf_rdy     : out    vl_logic;
        ui_clk          : out    vl_logic;
        ui_clk_sync_rst : out    vl_logic;
        init_calib_complete: out    vl_logic;
        sys_rst         : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AddressSize : constant is 1;
    attribute mti_svvh_generic_type of WordSize : constant is 1;
    attribute mti_svvh_generic_type of MEM_SIZE : constant is 3;
end mig_interface_model;
