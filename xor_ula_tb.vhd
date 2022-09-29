library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity xor_ula_tb is
end;

architecture a_xor_ula_tb of xor_ula_tb is
    component xor_ula is
        port
        (
            a     : IN unsigned (15 downto 0);
            b     : IN unsigned (15 downto 0);
            saida : OUT unsigned (15 downto 0)
        );
    end component;
    
    signal a, b, saida : unsigned(15 downto 0);
    
begin
    uut:  xor_ula  port map (a => a, b => b, saida => saida);
    process
    begin
        a <= "0000110000001100";
        b <= "0000110000001100";
        wait for 50 ns;
        a <= "0000110000001100";
        b <= "0000011100001100";
        wait for 50 ns;
        a <= "0000101100001100";
        b <= "0000011000001100";
        wait for 50 ns;
        a <= "0000100000001100";
        b <= "0001101100001100";
        wait for 50 ns;
        wait;
    end process;
end architecture;