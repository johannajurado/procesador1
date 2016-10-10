----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:18 10/10/2016 
-- Design Name: 
-- Module Name:    unidadControl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unidadControl is
    Port ( op : in  STD_LOGIC;
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salida_UC : out  STD_LOGIC_VECTOR (5 downto 0));
end unidadControl;

architecture Behavioral of unidadControl is

begin
    process(op,op3)
  begin
if (op="10")then
			       
					 case op3 is 
				
							when "000000" => -- ADD
								salida_UC  <= "000001";

							when "000100" => -- SUB
								 salida_UC <= "000010";
								 
							when "000001" => -- AND
								salida_UC <= "000011";
								 
							when "000101" => -- ANDN
								salida_UC <= "000100";
								 
							when "000010" => -- OR
								salida_UC <= "000101";
								
							when "000110" => -- ORN
								salida_UC <= "000110";
								 
							when "000011" => -- XOR
								salida_UC  <= "000111"; 
								
							when "000111" => -- XORN
								salida_UC <= "001000";
							when others => 
								salida_UC <= "111111"; 

						end case;
						 
		end if; 

end process; 

end Behavioral;

