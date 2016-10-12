----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:46 10/12/2016 
-- Design Name: 
-- Module Name:    procesador_finalaleja - arq_procesador 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity procesador_finalaleja is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           resultadoProcesador : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador_finalaleja;

architecture arq_procesador of procesador_finalaleja is


COMPONENT sumador
	PORT(
		entrada_sum1 : IN std_logic_vector(31 downto 0);
		entrada_sum2 : IN std_logic_vector(31 downto 0);          
		salida_sumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT nPC
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		actual : IN std_logic_vector(31 downto 0);          
		salida_nPC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PC
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		actual_PC : IN std_logic_vector(31 downto 0);          
		salida_PC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT memoriaInstrucciones
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal sumadorToNPC,npcToPC,pcToIM,imToUR: STD_LOGIC_VECTOR (31 downto 0);

begin

	Inst_sumador: sumador PORT MAP(
		entrada_sum1 =>x"00000001" ,
		entrada_sum2 =>npcToPC,
		salida_sumador =>sumadorToNPC 
	);



	Inst_nPC: nPC PORT MAP(
		clk =>clk ,
		reset =>reset ,
		actual =>sumadorToNPC ,
		salida_nPC =>npcToPC
	);

	Inst_PC: PC PORT MAP(
		clk =>clk ,
		reset =>reset ,
		actual_PC =>npcToPC ,
		salida_PC =>pcToIM 
	);

	Inst_memoriaInstrucciones: memoriaInstrucciones PORT MAP(
		direccion =>pcToIM ,
		instruccion =>imToUR  ,
		reset =>reset 
	);

end arq_procesador;

