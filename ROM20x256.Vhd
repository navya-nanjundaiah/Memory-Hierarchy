library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM20x256 is
	port (
		ADIN   : in STD_LOGIC_VECTOR(7 downto 0);

		DTOUT  : out STD_LOGIC_VECTOR(3 downto 0);				-- DATA bus
		COND14 : out STD_LOGIC;											-- COND1
		COND13 : out STD_LOGIC;											-- COND0
		PL12   : out STD_LOGIC;											-- Polarity
		BOP10  : out STD_LOGIC;											-- BOP10
		BOP09  : out STD_LOGIC;											--	BOP9
		BOP08  : out STD_LOGIC;											--	BOP8
		ADOUT  : out STD_LOGIC_VECTOR(7 downto 0)					-- ADDRESS bus
	);
end ROM20x256;

architecture Behavioral of ROM20x256 is
	signal ROMOUT : STD_LOGIC_VECTOR(20 downto 0);
begin
	ROMOUT <= "000000001000100000101" when ADIN = x"00" else
				 "111100011000100010100" when ADIN = x"01" else
				 "000000101000100100011" when ADIN = x"02" else
				 "100100111000100101100" when ADIN = x"03" else
				 "000000001011000000000" when ADIN = x"04" else
				 "000100000010100000000" when ADIN = x"05" else
				 "001000000010100000000" when ADIN = x"06" else
				 "001100000010100000000" when ADIN = x"07" else
				 "010000000010100000000" when ADIN = x"08" else
				 "010100000010100000000" when ADIN = x"09" else
				 "011000000010100000000" when ADIN = x"0A" else
				 "011100000010100000000" when ADIN = x"0B" else
				 "100000000010100000000" when ADIN = x"0C" else
				 "100100000010100000000" when ADIN = x"0D" else
				 "101000000010100000000" when ADIN = x"0E" else
				 "101100000010100000000" when ADIN = x"0F" else
				 "110000000010100000000" when ADIN = x"10" else
				 "110100000010100000000" when ADIN = x"11" else
				 "111000000010100000000" when ADIN = x"12" else
				 "111100000011000000000" when ADIN = x"13" else
				 "111000010010100000000" when ADIN = x"14" else
				 "110100010010100000000" when ADIN = x"15" else
				 "110000010010100000000" when ADIN = x"16" else
				 "101100010010100000000" when ADIN = x"17" else
				 "101000010010100000000" when ADIN = x"18" else
				 "100100010010100000000" when ADIN = x"19" else
				 "100000010010100000000" when ADIN = x"1A" else
				 "011100010010100000000" when ADIN = x"1B" else
				 "011000010010100000000" when ADIN = x"1C" else
				 "010100010010100000000" when ADIN = x"1D" else
 				 "010000010010100000000" when ADIN = x"1E" else
				 "001100010010100000000" when ADIN = x"1F" else
				 "001000010010100000000" when ADIN = x"20" else
				 "000100010010100000000" when ADIN = x"21" else
				 "000000010011000000001" when ADIN = x"22" else
 				 "000100100010100000000" when ADIN = x"23" else
				 "001000100010100000000" when ADIN = x"24" else
				 "001100100010100000000" when ADIN = x"25" else
				 "010000100010100000000" when ADIN = x"26" else
				 "010100100010100000000" when ADIN = x"27" else
 				 "011000100010100000000" when ADIN = x"28" else
				 "011100100010100000000" when ADIN = x"29" else
				 "100000100010100000000" when ADIN = x"2A" else
				 "100100100011000000010" when ADIN = x"2B" else
				 "100000110010100000000" when ADIN = x"2C" else
				 "011100110010100000000" when ADIN = x"2D" else
				 "011000110010100000000" when ADIN = x"2E" else
				 "010100110010100000000" when ADIN = x"2F" else
				 "010000110010100000000" when ADIN = x"30" else
				 "001100110010100000000" when ADIN = x"31" else
				 "001000110010100000000" when ADIN = x"32" else
				 "000100110010100000000" when ADIN = x"33" else
				 "000000110011000000011" when ADIN = x"34";    

	DTOUT(3 downto 0) <= ROMOUT(20 downto 17);
	COND14 <= ROMOUT(14);
	COND13 <= ROMOUT(13);
	PL12 <= ROMOUT(12);
	BOP10 <= ROMOUT(10);
	BOP09 <= ROMOUT(9);
	BOP08 <= ROMOUT(8);
	ADOUT(7 downto 0) <= ROMOUT(7 downto 0);
end Behavioral;
