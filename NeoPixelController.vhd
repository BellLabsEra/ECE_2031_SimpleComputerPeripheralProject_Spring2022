-- ====================================================
-- WS2812 communication interface starting point for
-- ECE 2031 final project spring 2022.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library altera_mf;
use altera_mf.altera_mf_components.all;



--	+-----------------------+
--	|	Peripheral's Entity: |
--	+-----------------------+
entity NeoPixelController is

	port(
		clk_10M   : in   std_logic;
		resetn    : in   std_logic;																		-- Active low signal
		io_write  : in   std_logic;
		cs_addr   : in   std_logic;
		cs_data   : in   std_logic;
		cs_mode   : in   std_logic; 																		-- mode controller signal
		data_in   : in   std_logic_vector(15 downto 0);
		sda       : out  std_logic
	); 

end entity;

--	+-----------------------------+
--	|	Peripheral's Architecture  |
--	+-----------------------------+

architecture internals of NeoPixelController is
	-- Architecture Declaration Section:
	-- ================================
	signal ram_read_addr, ram_write_addr : std_logic_vector(7 downto 0);						-- Signals for the RAM read (ram_read_addr) and write addresses (ram_write_addr)
	signal ram_we : std_logic;																				-- ram_we:					RAM write enable ~ 
	signal ram_read_data : std_logic_vector(23 downto 0);											-- ram_read_data:			Signals for data coming out of memory
	signal pixel_buffer : std_logic_vector(23 downto 0);											-- pixel_buffer:			Signal to store the current output pixel's color data
	signal ram_write_buffer : std_logic_vector(23 downto 0);										-- ram_write_buffer:		Signal SCOMP will write to before it gets stored into memory

	-- RAM interface state machine signals:
	-- ====================================
	type write_states is (idle, storing, copyall);																-- 
	signal wstate: write_states;																			--
	
	-- Mode signals:
	-- =============
	type mode_states is (ind16, all16, ind24, holdpx);														--
	signal mode: mode_states;																				--
	
	-- ==============================================================================
	--									Pixel Data Storage in RAM 
	--								============================
	--									======================
	-- This is the RAM that will store the pixel data.
	--
	--	Features:
	-- ---------
	-- <>	It is dual-ported.
	--			(A) SCOMP will access port "A",
	-- 		(B) NeoPixel controller will access port "B".
	-- ==============================================================================
	
	
begin


	pixelRAM : altsyncram
	GENERIC MAP (
		address_reg_b => "CLOCK0",
		clock_enable_input_a => "BYPASS",
		clock_enable_input_b => "BYPASS",
		clock_enable_output_a => "BYPASS",
		clock_enable_output_b => "BYPASS",
		indata_reg_b => "CLOCK0",
		init_file => "pixeldata.mif",
		intended_device_family => "Cyclone V",
		lpm_type => "altsyncram",
		numwords_a => 256,
		numwords_b => 256,
		operation_mode => "BIDIR_DUAL_PORT",
		outdata_aclr_a => "NONE",
		outdata_aclr_b => "NONE",
		outdata_reg_a => "UNREGISTERED",
		outdata_reg_b => "UNREGISTERED",
		power_up_uninitialized => "FALSE",
		read_during_write_mode_mixed_ports => "OLD_DATA",
		read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
		read_during_write_mode_port_b => "NEW_DATA_NO_NBE_READ",
		widthad_a => 8,
		widthad_b => 8,
		width_a => 24,
		width_b => 24,
		width_byteena_a => 1,
		width_byteena_b => 1,
		wrcontrol_wraddress_reg_b => "CLOCK0"
	)
	PORT MAP (
		address_a => ram_write_addr,
		address_b => ram_read_addr,
		clock0 => clk_10M,
		data_a => ram_write_buffer,
		data_b => x"000000",
		wren_a => ram_we,
		wren_b => '0',
		q_b => ram_read_data					-- 
	);
	-- ==============================================================================
	-- 										NeoPixel Protocol:
	-- 									========================
	-- This process implements the NeoPixel protocol by using several counters to keep track of clock cycles,
	-- which pixel is being written to, and which bit within that data is being written.
	-- 
	-- ==============================================================================

	process (clk_10M, resetn)
		-- protocol timing values (in 100s of ns)
		constant t1h : integer := 8; 						-- high time for '1'  | 800ns
		constant t0h : integer := 3; 						-- high time for '0'  | 300ns
		constant ttot : integer := 12; 					    -- total bit time     | 1200ns
		
		constant npix : integer := 256;

		variable bit_count   : integer range 0 to 31; 		-- bit_count:		which bit in the 24 bits is being sent
		variable enc_count   : integer range 0 to 31;		-- enc_count():	counter to count through the bit encoding
		variable reset_count : integer range 0 to 1000;		-- reset_count:	counter for the reset pulse
		variable pixel_count : integer range 0 to 255;		-- pixel_count:	Counter for the current pixel
		
		
	begin
		-- +-----------------------+
		-- |	RESET Enabled Mode	|
		-- +-----------------------+
		if resetn = '0' then
			-- reset all counters
			bit_count := 23;
			enc_count := 0;
			reset_count := 1000;
			-- set sda inactive
			sda <= '0';
		-- +-----------------------+
		-- |	RESET Disabled Mode	|
		-- +-----------------------+
		-- resetn = '1'
		elsif (rising_edge(clk_10M)) then
			-- +---------------------------------------------+
			-- | This IF block controls the various counters |
			-- +---------------------------------------------+
			if reset_count /= 0 then 									-- in reset/end-of-frame period
				-- during reset period, ensure other counters are reset
				pixel_count := 0;
				bit_count := 23;
				enc_count := 0;
				-- decrement the reset count
				reset_count := reset_count - 1;
				-- load data from memory
				pixel_buffer <= ram_read_data;
	
			-- =======================================================
			-- [Person's Name] : [Date] :
			-- ===========================
			-- [  Brief explanaition of what was changed and why	   ]
			-- [							. . .										]
			-- [							. . .										]
			-- ======================================================= 	
			else -- not in reset period (i.e. currently sending data)
				-- handle reaching end of a bit																		  ========================================
				if enc_count = (ttot-1) then 								-- is end of this bit?
					enc_count := 0;											-- 											I added this to do ....
					-- shift to next bit
					pixel_buffer <= pixel_buffer(22 downto 0) & '0';
					if bit_count = 0 then 									-- is end of this pixels's data?
						bit_count := 23; 										-- start a new pixel
						pixel_buffer <= ram_read_data;
						if pixel_count = npix-1 then 						-- is end of all pixels?				I added this to do ....
							-- begin the reset period
							reset_count := 1000;
						else
							pixel_count := pixel_count + 1;				-- 											[IF multilined comment blockI added this to do ....]
						end if;													--												[				...												]
					else															--												[				...												]
						-- if not end of this pixel's data, decrement count										I added this to do ....
						bit_count := bit_count - 1;
					end if;
				else																--
					-- within a bit, count to achieve correct pulse widths										I added this to do ....
					enc_count := enc_count + 1;
				end if;
			end if;																											
			-- ======================================================= 										===========================================
			
			-- This IF block controls the RAM read address to step through pixels
			if reset_count /= 0 then
				ram_read_addr <= x"00";
			elsif (bit_count = 1) AND (enc_count = 0) then
				-- increment the RAM address as each pixel ends
				ram_read_addr <= ram_read_addr + 1;
			end if;
			
			
			-- This IF block controls sda
			if reset_count > 0 then
				-- sda is 0 during reset/latch
				sda <= '0';
			elsif 
				-- sda is 1 in the first part of a bit.
				-- Length of first part depends on if bit is 1 or 0
				( (pixel_buffer(23) = '1') and (enc_count < t1h) )
				or
				( (pixel_buffer(23) = '0') and (enc_count < t0h) )
				then sda <= '1';
			else
				sda <= '0';
			end if;
			
		end if;
	end process;
	
	-- ==============================================================================
	
	-- ==============================================================================

	process(clk_10M, resetn, cs_addr)

	variable all16_counter	: integer range 0 to 1000;

	begin
		-- For this implementation, saving the memory address
		-- doesn't require anything special.  Just latch it when
		-- SCOMP sends it.
		if resetn = '0' then
			ram_write_addr <= x"00";																	-- What does this mean?
			
		elsif rising_edge(clk_10M) then

			if (io_write = '1') and (cs_addr = '1') then											-- If SCOMP is writing to the address register...
				ram_write_addr <= data_in(7 downto 0);										-- ram_write_addr: takes in data from SCOMP ????? (data has 8-bit resolution) ~ (8 Least Signficant Bits)
			elsif (io_write = '1') and (cs_data = '1') then		-- auto increment feature when writing colors
				ram_write_addr <= ram_write_addr + 1;			-- incremens the current write address after data is written in
			elsif (io_write = '1') and (cs_mode = '1') then										-- Else if SCOMP is writing to the mode...
				case data_in(3 downto 0) is																-- reads input (accepted range 0-15)
				when "0000" =>																					-- mode 0 is ind16
					mode <= ind16;
				when "0001" =>																					-- mode 1 is all16
					mode <= all16;
				when "0010" =>																					-- mode 2 is ind24
					mode <= ind24;
				when "0011" =>																					-- mode 3 is holdpx
					mode <= holdpx;
				when others =>																					-- (default mode is ind16)
					mode <= ind16;
				end case;
			elsif (wstate = copyall) then						
				ram_write_addr <= ram_write_addr + 1;		   -- auto increment to fill all the register with the same color
			end if;

		end if;
	
		-- +------------------------------------------------------+
		-- |	State Machine Protocol for Storing Data into Memory |
		-- +------------------------------------------------------+
		-- **CURRENTLY ONLY APPLIES TO ind16 MODE
		
		-- The sequnce of events needed to store data into memory will be implemented with a state machine.
		
		-- Although there are ways to more simply connect SCOMP's I/O system to an altsyncram module, 
		-- it would only work with under specific circumstances, and would be limited to just simple writes.
		
		-- Since you will probably want to do more complicated things, this is an
		-- example of something that could be extended to do more complicated things.
		
		-- IMPORTANT NOTE: 
		-- ===============
		-- 'ram_we' is *not* implemented as a Moore output of this state machine, 
		-- because Moore outputs are susceptible to glitches, and that's a bad thing for memory control signals.
		
		-- State Machine Info
		-- 3 States (wstaes):
		-- ------------------
		-- (1) idle ~
		-- (2) storing ~ 
		-- (3) others ~ 
		if resetn = '0' then
			wstate <= idle;
			mode <= ind16;
			all16_counter := 0;
			ram_we <= '0';
			ram_write_buffer <= x"000000";
			-- Note that resetting this device does NOT clear the memory.
			-- Clearing memory would require cycling through each address
			-- and setting them all to 0.
		elsif rising_edge(clk_10M) then
			case mode is
			when ind16 =>
				case wstate is
					when idle =>
						if (io_write = '1')  and (cs_data='1') then									-- [If SCOMP is writing to the address register...]
							-- latch the current data into the temporary storage register,
							-- because this is the only time it'll be available.
							-- Convert RGB565 to 24-bit color
							ram_write_buffer <= data_in(10 downto 5) & "00" & data_in(15 downto 11) & "000" & data_in(4 downto 0) & "000";
							-- can raise ram_we on the upcoming transition, because data
							-- won't be stored until next clock cycle.
							ram_we <= '1';
							-- Change state
							wstate <= storing;
						end if;
					when storing =>
						-- All that's needed here is to lower ram_we.  The RAM will be
						-- storing data on this clock edge, so ram_we can go low at the
						-- same time.
						ram_we <= '0';
						wstate <= idle;
					when others =>
						wstate <= idle;
				end case;
			
			when all16 =>
				-- implementation to set all pixels to the same color
				case wstate is 
					when idle =>
				
						if (io_write = '1') and (cs_data = '1') then
							ram_write_buffer <= data_in(10 downto 5) & "00" & data_in(15 downto 11) & "000" & data_in(4 downto 0) & "000";
							ram_we <= '1';
							all16_counter := 0;
							wstate <= copyall;
						end if;

					when copyall =>

						ram_write_buffer <= ram_write_buffer;
						ram_we <= '1';

						if (all16_counter = 1000) then
							wstate <= idle;
						else
							wstate <= copyall;
							all16_counter := all16_counter + 1;
						end if;

					when others =>
						wstate <= idle;
				end case;

			when holdpx =>
				-- implementation to hold pixel data until a command is given to change them all at once
				
			when ind24 =>
				-- implementation to set individual pixel to a 24-bit color
			when others =>
				mode <= ind16;
			end case;
		end if;
	end process;

	
	
end internals;
