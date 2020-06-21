library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity mux8 is
port(bop:in std_logic_vector (2 downto 0);
data_ready, opcode_ready, zf, sf, carry, cf_flag:in std_logic;
LOAD, CE:out std_logic);
end mux8;
architecture bhv_mux8 of mux8 is
begin
process(bop) is
begin
if(bop="000") then
CE<='1';
LOAD<='1';
elsif(bop="001") then
CE <='1';
LOAD <='0';
elsif(bop="010" and data_ready='1') then
CE <='1' ;
LOAD <='0';
elsif(bop="010" and data_ready='0') then
CE <='0';
LOAD <='1' ;
elsif(bop="011" and opcode_ready='1') then
CE <='1';
LOAD<='0';
elsif(bop="011" and opcode_ready='0') then
CE <= '0';
LOAD <='1';
elsif(bop="100" and zf='1') then
CE <='1';
LOAD <='0';
elsif(bop="100" and zf='0') then
CE <='0';
LOAD <='1';
---BRP BRANCH---
elsif(bop="101" and sf='0') then
CE<='1';
LOAD<='0';
elsif(bop="101" and sf='1') then
CE<='0';
LOAD<='1';
elsif(bop="110" and carry='1') then
CE<='1';
LOAD<='0';
elsif(bop="110" and carry='0') then
CE<='0';
LOAD<='1';
elsif(bop="111" and cf_flag='1') then
CE<='1';
LOAD<='0';
elsif(bop="110" and cf_flag='0') then
CE<='0';
LOAD<='1';
end if;
end process;
end bhv_mux8;