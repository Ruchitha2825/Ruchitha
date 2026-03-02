library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end tb;

architecture behavior of tb is
    signal clk : STD_LOGIC := '0';
    signal x   : STD_LOGIC := '0';
    signal z   : STD_LOGIC;

    component mealy
        Port ( clk : in STD_LOGIC;
               x   : in STD_LOGIC;
               z   : out STD_LOGIC);
    end component;
begin
    uut: mealy port map(clk, x, z);

    clk_process : process
    begin
        for i in 1 to 20 loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
        wait;
    end process;

    stim: process
    begin
        x <= '1'; wait for 10 ns;
        x <= '0'; wait for 10 ns;
        x <= '1'; wait for 10 ns;
        x <= '1'; wait for 10 ns;
        wait;
    end process;
end behavior;
