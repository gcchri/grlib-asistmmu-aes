library verilog;
use verilog.vl_types.all;
entity i2c_slave_model is
    generic(
        I2C_ADR         : vl_logic_vector(0 to 6) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        idle            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        slave_ack       : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        get_mem_adr     : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        gma_ack         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        data            : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        data_ack        : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1)
    );
    port(
        scl             : in     vl_logic;
        sda             : inout  vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of I2C_ADR : constant is 1;
    attribute mti_svvh_generic_type of idle : constant is 1;
    attribute mti_svvh_generic_type of slave_ack : constant is 1;
    attribute mti_svvh_generic_type of get_mem_adr : constant is 1;
    attribute mti_svvh_generic_type of gma_ack : constant is 1;
    attribute mti_svvh_generic_type of data : constant is 1;
    attribute mti_svvh_generic_type of data_ack : constant is 1;
end i2c_slave_model;
