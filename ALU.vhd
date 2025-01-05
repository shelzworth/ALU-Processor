library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    port (
        Clock      : in  std_logic; -- input clock signal
        A, B       : in  unsigned(7 downto 0); -- 8 bit input of latches A and B
        OP         : in  unsigned(15 downto 0); -- 16 bit selection for Math Operations using Decoder
        Neg        : out std_logic; -- if result is negative, this negates it
        R1         : out unsigned(3 downto 0); -- lower bit of 8-bit Result Output
        R2         : out unsigned(3 downto 0); -- higher bit of 8-bit Result Output
        CurrentOp  : out unsigned(15 downto 0)); -- Output signal indicating the current operation
end ALU;

architecture calculation of ALU is
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0');
    signal CurrentOp_internal : unsigned(15 downto 0) := (others => '0');
begin
    Reg1 <= A;
    Reg2 <= B;

    process(Clock, OP)
    begin
        if (rising_edge(Clock)) then
            case OP is
                when "0000000000000001" => --Addition Operation
                    Result <= Reg1 + "00000010";
                    CurrentOp_internal <= "0000000000000001";

                when "0000000000000010" => --Subtraction Operation
                    Result <= ("00" & Reg2(7 downto 2));
                    CurrentOp_internal <= "0000000000000010";

                when "0000000000000100" => --Inversion Operation
                    Result <= ("1111" & Reg1(7 downto 4));
                    CurrentOp_internal <= "0000000000000100";

                when "0000000000001000" => --NAND Operation
                    if (Reg1 < Reg2)
								then Result <= Reg1;
							elsif (Reg2 < Reg1)
								then Result <= Reg2;
							end if;
                    CurrentOp_internal <= "0000000000001000";

                when "0000000000010000" => --NOR Operation
                    Result <= Reg1(1 downto 0) & Reg1(7 downto 2);
                    CurrentOp_internal <= "0000000000010000";

                when "0000000000100000" => --AND Operation
                    Result <= (Reg2(0) & Reg2(1) & Reg2(2) & Reg2(3) & Reg2(4) & Reg2(5) & Reg2(6) & Reg2(7)); 
                    CurrentOp_internal <= "0000000000100000";

                when "0000000001000000" => --OR Operation
                    Result <= Reg1 XOR Reg2;
                    CurrentOp_internal <= "0000000001000000";

                when "0000000010000000" => --XOR Operation
                    Result <= (Reg1 + Reg2) - "00000100";
                    CurrentOp_internal <= "0000000010000000";

                when "0000000100000000" => --XNOR Operation
                    Result <= ("11111111");
                    CurrentOp_internal <= "0000000100000000";

                when others => -- Rest is negative
                    Result <= (others => '-');
                    CurrentOp_internal <= (others => '-');
            end case;
        end if;
    end process;

    R1 <= Result(3 downto 0);
    R2 <= Result(7 downto 4);
    CurrentOp <= CurrentOp_internal;
end calculation;