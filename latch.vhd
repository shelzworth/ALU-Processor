library ieee;
use ieee.std_logic_1164.all;

entity latch1 is
port (
A : in std_logic_vector(7 downto 0);
resetn, clock : in std_logic;
Q : out std_logic_vector(7 downto 0)
);
end latch1;
architecture Behavior of latch1 is
begin
process (resetn, clock)
begin
if clock'event and clock = '1' then
Q <= A;
end if;
end process;
end Behavior;