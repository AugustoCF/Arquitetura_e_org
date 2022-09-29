library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_4 is
    port(
        op0, op1 : in std_logic;
        instr0, instr1, instr2, instr3 : in unsigned(15 downto 0);
        instr_saida : out unsigned(15 downto 0)
    );
end entity mux_4;

architecture a_mux_4 of mux_4 is
begin
    instr_saida <= instr0 when op1 = '0' and op0 = '0' else
                   instr1 when op1 = '0' and op0 = '1' else
                   instr2 when op1 = '1' and op0 = '0' else
                   instr3 when op1 = '1' and op0 = '1' else
                   "0000000000000000";
end architecture a_mux_4;