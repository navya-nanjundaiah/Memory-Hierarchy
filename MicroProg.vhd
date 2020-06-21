library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity MicroProg is
port( Cout: in std_logic_vector (7 downto 0);
Addr :out std_logic_vector (7 downto 0);
DB :out std_logic;
BOP :out std_logic_vector (2 downto 0);
Regin : out std_logic;
CF: out std_logic_vector(1 downto 0);
ALUops: out std_logic_vector(3 downto 0);
ALUsrc: out std_logic_vector(2 downto 0);
ALUdest: out std_logic_vector(1 downto 0));
end MicroProg;
architecture Behavioral of MicroProgis
signal ROMOUT: std_logic_vector(23 downto 0);
begin
ROMOUT <= "000000110000011000010000" when Cout = x"00" else
"000000110001010000010001" when Cout = x"10" else
"000000110001000000010010" when Cout = x"11" else
"000000110001010000010011" when Cout = x"12" else
"010000110001000000010100" when Cout = x"13" else
"101000001110001100000000" when Cout = x"14";
ALUdest<= ROMOUT(23 downto 22);
ALUsrc <= ROMOUT(21 downto 19);
ALUops <= ROMOUT(18 downto 15);
CF <= ROMOUT(14 downto 13);
Regin <= ROMOUT(12);
BOP <= ROMOUT(11 downto 9);
DB <= ROMOUT(08);
Addr(7 downto 0) <= ROMOUT(7 downto 0);
end Behavioral;