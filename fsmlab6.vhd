library ieee;
use ieee.std_logic_1164.all;
entity moore_machine is
	port(
		clock : in std_logic;
		data_in : in std_logic;
		reset : in std_logic;
		student_id: out std_logic_vector(3 downto 0);
		current_state: out std_logic_vector(3 downto 0));
end entity;

architecture fsmlab6 of moore_machine is
	
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);

	signal state : state_type;	
	--signal data_out: std_logic_vector(3 downto 0);
	--signal current_statee: std_logic_vector (3 downto 0);
	
begin
	process(clock, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (clock'event and clock = '1' AND data_in = '1') then
		
			case state is
				when s0 => 
					if data_in = '1'then 
						state<= s1;
					else
						state <=s0;
					end if;
					
				when s1 => 
					if data_in = '1'then 
						state<= s2;
					else
						state <=s1;
					end if;
					
				when s2 => 
					if data_in = '1'then 
						state<= s3;
					else
						state <=s2;
					end if;
					
				when s3 => 
					if data_in = '1'then 
						state<= s4;
					else
						state <=s3;
					end if;
					
				when s4 => 
					if data_in = '1'then 
						state<= s5;
					else
						state <=s4;
					end if;
					
				when s5 => 
					if data_in = '1'then 
						state<= s6;
					else
						state <=s5;
					end if;
					
				when s6 => 
					if data_in = '1'then 
						state<= s7;
					else
						state <=s6;
					end if;
					
				when s7 => 
					if data_in = '1'then 
						state<= s8;
					else
						state <=s7;
					end if;
					
				when s8 => 
					if data_in = '1'then 
						state<= s0;
					else
						state <=s8;
					end if;
				
			end case;
		end if;
	end process;
	 
	process (state)
		begin
			case state is
				when s0 => 
						student_id <= "0101";
				
				
				when s1 =>
						student_id <= "0000";

					
				when s2 =>
						student_id <= "0001";
				
					
				when s3=>
						student_id <= "0001";
					
					
				when s4 => 
						student_id <= "0101";
				
					
				when s5 => 
						student_id <= "1001";
					
				
				when s6 => 
						student_id <= "1001";
					
					
				when s7 => 
						student_id <= "0100";
				
				when s8 => 
						student_id <= "0111";
				
		end case;
	end process;
	
	process (state, data_in)
		begin
			case state is
				when s0 =>
					if data_in = '1' then
						current_state <= "0000";
					else
						current_state <= "0000";
					end if;
				
				when s1 =>
					if data_in = '1' then
						current_state <= "0001";
					else
						current_state <= "0001";
					end if;
					
				when s2 =>
					if data_in = '1' then
						current_state <= "0010";
					else
						current_state <= "0010";
					end if;
					
				when s3 =>
					if data_in = '1' then
						current_state <= "0011";
					else
						current_state <= "0011";
					end if;
					
				when s4 =>
					if data_in = '1' then
						current_state <= "0100";
					else
						current_state <= "0100";
					end if;
					
				when s5 =>
					if data_in = '1' then
						current_state <= "0101";
					else
						current_state <= "0101";
					end if;
					
				when s6 =>
					if data_in = '1' then
						current_state <= "0110";
					else
						current_state <= "0110";
					end if;
					
				when s7 =>
					if data_in = '1' then
						current_state <= "0111";
					else
						current_state <= "0111";
					end if;
				
				when s8 =>
					if data_in = '1' then
						current_state <= "1000";
					else
						current_state <= "1000";
					end if;
				
			end case;
	end process;
	
end fsmlab6;