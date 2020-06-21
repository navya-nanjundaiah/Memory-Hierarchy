library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_NUMERIC.AL
entity alu_1 is
port(ta, tb:in std_logic_vector (15 downto 0);
clk, cf_Flag:in std_logic;
ALUops:in std_logic_vector (3 downto 0);
ALUout:inout std_logic_vector (15 downto 0);
zf, sf, carry:out std_logic);
end alu_1;
architecture bhv_alu _1of alu is
begin
process(clk) is
begin
if rising_edge(clk) then
------wait operations-------------------
if(ALUops="0000") then
ALUout<=x"0000";
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
--------add operation------
elsif(ALUops="0001") then
ALUout<= ta + tb+ cf_Flag;
sf<=ALUout(15);
if(ALUout=x"0000") then
PROJECT-2
NAVYA NANJUNDAIAH
CWID:893288019
zf<='1';
else
zf<='0';
end if;
-----subtreaction operation-------
elsif(ALUops="0010") then
ALUout<= ta-tb-cf Flag;
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
-----or operation-------
elsif(ALUops="0011") then
ALUout<= ta or tb;
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
-------and operation-------
elsif(ALUops="0100") then
ALUout<= ta and tb;
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
------xor operation------
elsif(ALUops="0101") then
ALUout<= ta xor tb;
PROJECT-2
NAVYA NANJUNDAIAH
CWID:893288019
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
-----pass operatoion---------
elsif(ALUops="0110") then
ALUout<= ta;
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
----not operation------
elsif(ALUops="0111") then
ALUout<= not ta;
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
----shift left with cf------
elsif(ALUops="1000") then
ALUout(15 downto 1)<= ta(14 downto 0);
ALUout(0)<= cf_Flag;
carry<= ta(15);
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
PROJECT-2
NAVYA NANJUNDAIAH
CWID:893288019
end if;
----shift right with cf------
elsif(ALUops="1001") then
ALUout(14 downto 0)<= TA(15 downto 1);
ALUout(15)<= CF_Flag;
carry<= TA(0);
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
-----decrement------
elsif(ALUops="1010") then
ALUout<= TA - x"0001";
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
----increment operation------
ALUout<= TA + x"0001";
elsif(ALUops="1011") then
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
---clear operation------
elsif(ALUops="0101") then
PROJECT-2
NAVYA NANJUNDAIAH
CWID:893288019
ALUout<= x"0000";
sf<=ALUout(15);
if(ALUout=x"0000") then
zf<='1';
else
zf<='0';
end if;
end if;
end if;
end process;
end bhv_alu;