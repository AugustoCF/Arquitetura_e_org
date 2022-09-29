library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Ula is
    port(
        dado1, dado2 : in unsigned(15 downto 0);
        op0, op1 : in std_logic;
        saida_dado : out unsigned(15 downto 0);
        saida_sinalizacao: out std_logic               -- para verificacao de resultado zero
    );
end entity Ula;


architecture a_Ula of Ula is
    component mux_4 is
        port
        (
            op0         : IN std_logic ;
            op1         : IN std_logic ;
            instr0      : IN unsigned (15 downto 0);
            instr1      : IN unsigned (15 downto 0);
            instr2      : IN unsigned (15 downto 0);
            instr3      : IN unsigned (15 downto 0);
            instr_saida : OUT unsigned (15 downto 0)
        );
    end component;
    component menor is
        port
        (
            x         : IN unsigned (15 downto 0);
            y         : IN unsigned (15 downto 0);
            resultado : OUT unsigned (15 downto 0)
        );
    end component;
    component soma is
        port
        (
            x   : IN unsigned (15 downto 0);
            y   : IN unsigned (15 downto 0);
            sum : OUT unsigned (15 downto 0)
        );
    end component;
    component subtracao is
        port
        (
            x   : IN unsigned (15 downto 0);
            y   : IN unsigned (15 downto 0);
            sub : OUT unsigned (15 downto 0)
        );
    end component;
    component xor_ula is
        port
        (
            x     : IN unsigned (15 downto 0);
            y     : IN unsigned (15 downto 0);
            saida : OUT unsigned (15 downto 0)
        );
    end component;
    signal x, y, result_soma, result_sub, result_xor, result_menor, result_aux : unsigned(15 downto 0);
begin
    u_soma:  soma port map(x => x, y => y, sum => result_soma);
    u_sub:   subtracao port map(x => x, y => y, sub => result_sub);
    u_xor:   xor_ula port map(x => x, y => y, saida => result_xor);
    u_menor: menor port map(x => x, y => y, resultado => result_menor);
    u_mux: mux_4 port map(op0 => op0, op1 => op1, instr0 => result_soma, instr1 => result_sub, instr2 => result_xor, instr3 => result_menor, instr_saida => result_aux);
    
    process
    begin
        x <= dado1;
        y <= dado2;
        
        saida_dado <= result_aux;
        
        if result_sub = "0000000000000000" then
            saida_sinalizacao <= '1';
        else
            saida_sinalizacao <= '0';
            
        end if;
        end process;
 
    end architecture a_Ula;