----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    10:29:16 02/17/2016
-- Design Name:
-- Module Name:    asist_mmu - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.config_types.all;
use grlib.config.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.libiu.all;
use gaisler.libcache.all;
use gaisler.mmuconfig.all;
use gaisler.mmuiface.all;
use gaisler.leon3.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity asist_mmu is
	port (
		rst			: in  std_logic;
		clk			: in  std_logic;

		usrkey 		: in  std_logic_vector(31 downto 0);
    	oskey 		: in  std_logic_vector(31 downto 0);
    	usrtsp		: in  std_logic_vector(255 downto 0);
    	ostsp		: in  std_logic_vector(255 downto 0);
    	asist_mode 	: in  std_logic_vector(31 downto 0);

		mcii		: in  memory_ic_in_type;
		mcio		: in  memory_ic_out_type;
		asist_mcii	: out memory_ic_in_type;
		asist_mcio	: out memory_ic_out_type;

		-- AES unit
		crypto_cacheline   : out std_logic_vector(127 downto 0);
		aesdata_load	   : out std_logic;
		aeskey_load		   : out std_logic;
		aes_key		 	   : out std_logic_vector(127 downto 0);

		plainText	: in  std_logic_vector(127 downto 0);
		decr_ready	: in  std_logic
	);

end ;

architecture rtl of asist_mmu is

	type asiststatetype is (idle, readwait, reading1, reading2, reading3, delay, playback1, playback2, playback3, playback4, lastplay);

	type asist_control_type is record


		asist_state 	: asiststatetype;

		cacheline_wen 	: std_logic_vector(3 downto 0);
		aeskey_load		: std_logic;
	end record;

	constant RESET_ALL : boolean := GRLIB_CONFIG_ARRAY(grlib_sync_reset_enable_all) = 1;
	constant RRES : asist_control_type := (

		asist_state		=> idle,
		cacheline_wen	=> (others => '0'),
		aeskey_load		=> '0'
	);

	signal r, c : asist_control_type;


	signal cacheline  		: std_logic_vector (127 downto 0);
	signal cachelineplaintext  : std_logic_vector(127 downto 0);
	signal aes_key_int :	std_logic_vector(127 downto 0);



begin

asistctrl : process(rst, r, mcii, mcio, cacheline, decr_ready, asist_mode, ostsp)
	variable v 				: asist_control_type;



	variable data			: std_logic_vector(31 downto 0);
	variable ready			: std_logic;
	variable grant 			: std_logic;
	variable retry 			: std_logic;
	variable mexc 			: std_logic;
	variable cache 			: std_logic;
	variable scanen 		: std_logic;


	variable address 		: std_logic_vector(31 downto 0);
	variable burst			: std_ulogic;
	variable req			: std_ulogic;
	variable su 			: std_ulogic;
	variable flush			: std_ulogic;

	variable data_load		: std_logic;
	begin



	--variable init
	v := r;

	data := mcio.data; ready := '0';
	retry := '0'; mexc := '0'; scanen := '0';
	grant := '0'; cache := '0';

	burst := '0'; req := '0'; su := '0';
	address := mcii.address; flush := '0';

	v.cacheline_wen := (others => '0');
	v.aeskey_load := '0';

	 data_load := '0';

	case r.asist_state is
		when idle =>
				data   := mcio.data;
				retry  := mcio.retry;
				mexc   := mcio.mexc;
				scanen := mcio.scanen;
				su 	   := mcii.su;
				flush  := mcii.flush;
				burst  := mcii.burst;
				req    := mcii.req;
				--Check if the key is changed when idle
				v.aeskey_load := '1';

			if ((mcii.req and mcii.burst) = '1' and mcii.address >= x"40000000") then
				ready := '0';
				cache := '0';
				grant := '1';

				address(31 downto 4) := mcii.address(31 downto 4);
				address(3 downto 0)  := x"0";
				v.asist_state := readwait;

			else
				address:= mcii.address;

				ready  		:= mcio.ready;
				grant  		:= mcio.grant;
				cache 		:= mcio.cache;
			end if;
		when readwait =>
			cache  := '1';
			ready  := '0';
			grant  := '0';
			burst  := mcii.burst;
			req    := mcii.req;
			data   := mcio.data;
			retry  := mcio.retry;
			mexc   := mcio.mexc;
			scanen := mcio.scanen;
			address:= mcii.address;
			su 	   := mcii.su;
			flush  := mcii.flush;

			data_load := '0';

			address(31 downto 4) := mcii.address(31 downto 4);
			address(3 downto 0)  := x"0";
			v.cacheline_wen(0) := '1';

			if (mcio.ready = '1' and mcio.grant = '1') then
				v.cacheline_wen(1) := '1';
				v.cacheline_wen(0) := '0';

				v.asist_state := reading1;
			end if;
		when reading1 =>
			cache := '1';
			ready := '0';
			grant := '0';
			data  := x"00000000";

			retry  := mcio.retry;
			mexc   := mcio.mexc;
			scanen := mcio.scanen;
			address(31 downto 4) := mcii.address(31 downto 4);

			su 	   := mcii.su;
			flush  := mcii.flush;

			data_load := '0';

			address (3 downto 0) := x"4";
			burst := '1';
			req := '1';
			if (mcio.ready = '1') then
				v.cacheline_wen (2) := '1';
				v.cacheline_wen (1) := '0';

				v.asist_state := reading2;
			end if;

		when reading2 =>
			cache := '1';
			ready := '0';
			grant := '0';
			data  := x"00000000";

			retry  := mcio.retry;
			mexc   := mcio.mexc;
			scanen := mcio.scanen;
			address(31 downto 4) := mcii.address(31 downto 4);

			su 	   := mcii.su;
			flush  := mcii.flush;

			data_load := '0';

			address (3 downto 0) := x"8";
			burst := '1';
			req := '1';
			if (mcio.ready = '1') then
				v.cacheline_wen (3) := '1';
				v.cacheline_wen (2) := '0';

				v.asist_state := reading3;
			end if;

		when reading3 =>
			cache := '1';
			ready := '0';
			grant := '0';
			data  := x"00000000";

			retry  := mcio.retry;
			mexc   := mcio.mexc;
			scanen := mcio.scanen;
			address(31 downto 4) := mcii.address(31 downto 4);

			su 	   := mcii.su;
			flush  := mcii.flush;



			address (3 downto 0) := x"C";
			burst := '0';
			req := '0';
			if (mcio.ready = '1') then
				v.cacheline_wen (3) := '0';
				v.asist_state := delay;
			end if;
			if(asist_mode(1 downto 0) = "11") then
				data_load	:= '1';
			else
				data_load	:= '0';
			end if;
		when delay =>
			data_load := '0';

			cache := '1';
			ready := '0';
			grant := '0';
			burst := '0';
			req   := '0';

			retry  := mcio.retry;
			mexc   := mcio.mexc;
			scanen := mcio.scanen;

			address:= mcii.address;
			su 	   := mcii.su;
			flush  := mcii.flush;
			data   := x"00000000";

			if (asist_mode (1 downto 0) = "11") then
				if (decr_ready = '1') then

					if (mcii.address(3 downto 0) = x"0") then
						v.asist_state := playback1;
					elsif (mcii.address(3 downto 0) = x"4") then
						v.asist_state := playback2;
					elsif (mcii.address(3 downto 0) = x"8") then
						v.asist_state := playback3;
					elsif (mcii.address(3 downto 0) = x"C") then
						v.asist_state := playback4;
					else
						v.asist_state := idle;
					end if;
				elsif(decr_ready = '0') then
					v.asist_state := delay;
				else
					v.asist_state := idle;

				end if;
			else
				if (mcii.address(3 downto 0) = x"0") then
					v.asist_state := playback1;
				elsif (mcii.address(3 downto 0) = x"4") then
					v.asist_state := playback2;
				elsif (mcii.address(3 downto 0) = x"8") then
					v.asist_state := playback3;
				elsif (mcii.address(3 downto 0) = x"C") then
					v.asist_state := playback4;
				else
					v.asist_state := idle;
				end if;
			end if;

		when playback1 =>
			address := x"00000000";
			burst 	:= '0';
			req		:= '0';
			su      := mcii.su;
			flush 	:= '0';
			data_load := '0';
			ready := '1';
			cache := '1';
			mexc  := '0';
			scanen := mcio.scanen;
			retry := '0';
			grant := '1';

			if (asist_mode (1 downto 0)= b"11") then
				data := cachelineplaintext (31 downto 0);
			else
				data := cacheline (31 downto 0);
			end if;
			v.asist_state := playback2;
		when playback2 =>
			address := x"00000000";
			burst 	:= '0';
			req		:= '0';
			su      := mcii.su;
			flush 	:= '0';

			ready := '1';
			cache := '1';
			mexc  := '0';
			scanen := mcio.scanen;
			retry := '0';
			grant := '1';

			if (asist_mode (1 downto 0)= b"11") then
				data := cachelineplaintext (63 downto 32);
			else
				data := cacheline (63 downto 32);
			end if;
			v.asist_state := playback3;
			data_load := '0';
		when playback3 =>
			address := x"00000000";
			burst 	:= '0';
			req		:= '0';
			su      := mcii.su;
			flush 	:= '0';

			ready := '1';
			cache := '1';
			mexc  := '0';
			scanen := mcio.scanen;
			retry := '0';
			grant := '1';

			if (asist_mode (1 downto 0)= b"11") then
				data := cachelineplaintext (95 downto 64);
			else
				data := cacheline (95 downto 64);
			end if;
			v.asist_state := playback4;
			data_load := '0';

		when playback4 =>
			address := x"00000000";
			burst 	:= '0';
			req		:= '0';
			su      := mcii.su;
			flush 	:= '0';

			ready := '1';
			cache := '1';
			mexc  := '0';
			scanen := mcio.scanen;
			retry := '0';
			grant := '0';

			if (asist_mode (1 downto 0)= b"11") then
				data := cachelineplaintext(127 downto 96);
			else
				data := cacheline(127 downto 96);
			end if;
			v.asist_state := lastplay;
			data_load := '0';
		when lastplay =>
			burst 	:= '0';
			req		:= '0';
			su      := mcii.su;
			flush 	:= '0';


			ready  := '0';
			data   := x"0000FFFF";
			grant  := '0';
			retry  := '0';
			mexc   := '0';
			cache  := '0';
			scanen := '0';
			v.asist_state := idle;

			data_load := '0';


		when others =>
			v.asist_state := idle;

	end case;

	--RESET
	if (not RESET_ALL) and (rst = '0') then
      v.asist_state := idle;
      v.cacheline_wen := (others => '0');
    end if;

	--drive signals

	c <= v;

	--asist <-> icache

	if (asist_mode(1 downto 0) = "01") then
		if (mcii.su = '1') then
			asist_mcio.data 	<= data xor oskey;
		else
			asist_mcio.data 	<= data xor usrkey;
		end if;
	else
		asist_mcio.data 	<= data;
	end if;
	--asist <-> instruction cache controler
	asist_mcio.ready	<= ready;
	asist_mcio.grant	<= grant;
	asist_mcio.retry	<= retry;
	asist_mcio.mexc		<= mexc;
	asist_mcio.cache 	<= cache;
	asist_mcio.scanen 	<= scanen;


	--asist <-> memory controler
	asist_mcii.address (31 downto 0) 	<= address(31 downto 0) ;
	asist_mcii.burst	<= burst;
	asist_mcii.req		<= req;
	asist_mcii.su 		<= su;
	asist_mcii.flush 	<= flush;

	--asist <-> AES unit
	-- AES unit
	-- concatenate the last data from the bus with the internal cache line register
	-- A clean solution would be to use one extra cycle.
	-- The key load is driven by the aes key process bellow
	crypto_cacheline (95 downto 0) <= Cacheline(95 downto 0);
	crypto_cacheline (127 downto 96) <= mcio.data;
	aesdata_load 	 <= data_load;
	aes_key 		 <= aes_key_int;


end process;

reg : process(clk)
	begin
		if rising_edge(clk) then
			r <= c;
			if RESET_ALL and (rst = '0') then
				r <= RRES;
			end if;
		end if;
end process;



aes_key_int_proc : process (clk, rst)
variable key_load : std_logic;

begin
	if (rising_edge(clk)) then
		if (rst = '0') then
			aes_key_int <= (others  => '0');
			key_load := '0';
	    else
		      if (r.aeskey_load = '1') then
			     if (mcii.su = '1') then
				    if (aes_key_int /= ostsp(127 downto 0)) then
					   key_load := '1';
					   aes_key_int <= ostsp(127 downto 0);
			         else
			            key_load := '0';
                        aes_key_int <= aes_key_int;
                     end if;
		          else
				     if (aes_key_int /= usrtsp(127 downto 0)) then
					   key_load := '1';
					   aes_key_int <= usrtsp(127 downto 0);
				     else
				        key_load := '0';
                        aes_key_int <= aes_key_int;
				     end if;
			      end if;
	           end if;
	     end if;
	end if;
	aeskey_load <= key_load;
end process;






asist_cacheline : process(clk,rst)
begin
  if ( rising_edge(clk) ) then
    if ( rst = '0' ) then

    	cacheline  <= (others => '0');
    else
    	if(r.cacheline_wen(0) = '1') then
    		--cacheline0 <= mcio.data;
    		cacheline (31 downto 0) <= mcio.data;
    	elsif (r.cacheline_wen(1) = '1') then
    		--cacheline1 <= mcio.data;
    		cacheline (63 downto 32) <= mcio.data;
    	elsif (r.cacheline_wen(2) = '1') then
    		--cacheline2 <= mcio.data;
    		cacheline (95 downto 64) <= mcio.data;
    	elsif (r.cacheline_wen(3) = '1') then
    		--cacheline3 <= mcio.data;
    		cacheline (127 downto 96) <= mcio.data;
    	end if;
    end if;
  end if;
end process;

cacheline_plain_reg : process(clk,rst, decr_ready)
begin
  if ( rising_edge(clk) ) then
    if ( rst = '0' ) then
		cachelineplaintext  <= (others => '0');
    else
    	if(decr_ready = '1') then
    		cachelineplaintext <= plainText;
    	else
    		cachelineplaintext  <= cachelineplaintext;
    	end if;
    end if;

  end if;
end process;



end ;
