library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mealy is
    Port ( clk : in STD_LOGIC;
           x   : in STD_LOGIC;
           z   : out STD_LOGIC);
end mealy;

architecture Behavioral of mealy is
    type state_type is (S0, S1, S2, S3);
    signal state : state_type := S0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when S0 =>
                    if x = '1' then state <= S1;
                    else state <= S0;
                    end if;
                when S1 =>
                    if x = '0' then state <= S2;
                    else state <= S1;
                    end if;
                when S2 =>
                    if x = '1' then state <= S3;
                    else state <= S0;
                    end if;
                when S3 =>
                    if x = '1' then state <= S1;
                    else state <= S2;
                    end if;
            end case;
        end if;
    end process;

    z <= '1' when (state = S3 and x = '1') else '0';
end Behavioral;
