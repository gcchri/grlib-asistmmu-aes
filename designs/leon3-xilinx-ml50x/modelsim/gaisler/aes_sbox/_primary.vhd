library verilog;
use verilog.vl_types.all;
entity aes_sbox is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        d               : out    vl_logic_vector(7 downto 0)
    );
end aes_sbox;
