library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity buffercontrol is
port(DB: in std_logic ;
Regin: in std_logic ;
A,B,C,D : out std_logic);
end buffercontrol;
architecture Behavioral of buffercontrol is
begin
process(Regin,DB) is
begin
if(Regin ='0' and DB='0') then
A<='0';
B<='0';
C<='0';
D<='1';
elsif
(Regin ='0' and DB='1') then
A<='0';
B<='0';
C<='1';
D<='1';
elsif
(Regin ='1' and DB='0') then
A<='0';
B<='1';
C<='0';
D=<='0';
elsif
(Regin ='1' and DB='1') then
A<='1';
B<='0';
C<='0';
D<='0';
end if;
end process;
end Behavioral;