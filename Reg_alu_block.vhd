library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Reg_alu_block is
port(ALUsrc:in std_logic_vector (2 downto 0);
A, B, C, L: in std_logic_vector (15 downto 0);
clk: in std_logic;
TA, TB: out std_logic_vector (15 downto 0));
end Reg_alu_block;
architecture bhv of Reg_alu_block is
begin
process(clk, ALUsrc) is
begin
if rising_edge(clk) then
if(ALUsrc="000") then
TA<=A;
TB<=x"0000";
elsif(ALUsrc="001") then
TA<=B;
TB<=x"0000";
elsif(ALUsrc="010") then
TA<=C;
TB<=x"0000";
elsif(ALUsrc="011") then
TA<=L;
TB<=x"0000";
elsif(ALUsrc="100") then
TA<=A;
TB<=B;
elsif(ALUsrc="101") then
TA<=A;
TB<=C;
elsif(ALUsrc="110") then
TA<=L;
TB<=B;
elsif(ALUsrc="111") then
TA<=L;
TB<=C;
end if;
end if;
end process;
end bhv;