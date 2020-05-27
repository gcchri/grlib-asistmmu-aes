library verilog;
use verilog.vl_types.all;
entity aes_key_expand_128 is
    port(
        clk             : in     vl_logic;
        kld             : in     vl_logic;
        key             : in     vl_logic_vector(127 downto 0);
        wo_0            : out    vl_logic_vector(31 downto 0);
        wo_1            : out    vl_logic_vector(31 downto 0);
        wo_2            : out    vl_logic_vector(31 downto 0);
        wo_3            : out    vl_logic_vector(31 downto 0)
    );
end aes_key_expand_128;
