with Ada.Text_IO; use Ada.Text_IO;

procedure main is

	Filename   : constant String := "../docs/Sudoku.dat";
	File       : File_Type;
	Line_Count : Integer := -1;
	type Sudoku is Array (0 .. 8, 0 .. 8) of Integer;
	Matrix : Sudoku;
	type Boolean_Grid is Array (0 .. 8, 0 .. 8) of Boolean;

	Row : Integer := 0;
	Column : Integer := 0;

	Sudoku_Solved : Boolean := false;

	procedure Print_Grid(Matrix : in Sudoku) is
	begin
		Put_Line ("+------+------+------+");
		Put ("|");
		for i in 0 .. 8 loop --rows
			if (Row = 3) then
				Put_Line ("+------+------+------+");
				Row := 0;
			end if;
			Row := Row + 1;
			for j in 0 .. 8 loop --columns
				if (Column = 3) then
					Put ("|");
					Column := 0;
				end if;
				Column := Column + 1;

				if (((j+1) mod 9) = 0) then
					Put_Line (Natural'Image (Matrix(i, j)) & "|");
				else
					Put (Natural'Image (Matrix(i, j)));
				end if;
			end loop;	
		end loop;

		Put_Line ("+------+------+------+");
	end Print_Grid;

	procedure Print_Boolean_Grid(Matrix : in Boolean_Grid) is
	begin
		Put_Line ("+------+------+------+");
		Put ("|");
		for i in 0 .. 8 loop --rows
			if (Row = 3) then
				Put_Line ("+------+------+------+");
				Row := 0;
			end if;
			Row := Row + 1;
			for j in 0 .. 8 loop --columns
				if (Column = 3) then
					Put ("|");
					Column := 0;
				end if;
				Column := Column + 1;

				if (((j+1) mod 9) = 0) then
					Put_Line (Boolean'Image (Matrix(i, j)) & "|");
				else
					Put (Boolean'Image (Matrix(i, j)));
				end if;
			end loop;	
		end loop;

		Put_Line ("+------+------+------+");
	end Print_Boolean_Grid;

	function Find_Solved(Grid : Sudoku) return Boolean_Grid is
		Is_Solved: Boolean_Grid;
	begin
		for i in 0 .. 8 loop
			for j in 0 .. 8 loop
				if (Grid (i, j) = 0) then
					Is_Solved (i, j) := false;
				else
					Is_Solved (i, j) := true;
				end if;
			end loop;
		end loop;
 		return Is_Solved;
	end Find_Solved;

	function Solve(Grid : in out Sudoku) return Boolean is
		Is_Solved : constant Boolean_Grid := Find_Solved(Grid);
		Row, Col, k : Integer := 0;
		Back_Tracking : boolean := false;
		
		type Square_Grid is Array (0 .. 2, 0 .. 2) of Integer;
		Square : Square_Grid;
		
		Square_Number : Integer;
		Used_In_Row, Used_In_Col, Used_In_Grid : Boolean;

	begin
		while ((k >= 0) and (k < 81)) loop
			Row := k/9;
			Col := k mod 9;

			--Put_Line(Integer'Image (Row) & (Col));

			if (Is_Solved(Row, Col) /= true) then
				Grid(Row, Col) := Grid(Row, Col) + 1;
				
				Put_Line("Row:" & Integer'Image (Row));
				Put_Line("Col:" & Integer'Image (Col));
				Square_Number := ((((Row) / (3)) + ((Col) / (3))) * (4));

					Put_Line("square number:" & Integer'Image (Square_Number));
					if (Square_Number = 1) then
						for i in 0 .. 2 loop
							for j in 0 .. 2 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					elsif (Square_Number = 2) then
						for i in 0 .. 2 loop
							for j in 3 .. 5 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					elsif (Square_Number = 3) then
						for i in 0 .. 2 loop
							for j in 6 .. 8 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					elsif (Square_Number = 4) then
						for i in 3 .. 5 loop
							for j in 0 .. 2 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					elsif (Square_Number = 5) then
						for i in 3 .. 5 loop
							for j in 3 .. 5 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					elsif (Square_Number = 6) then
						for i in 3 .. 5 loop
							for j in 6 .. 8 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					elsif (Square_Number = 7) then
						for i in 6 .. 8 loop
							for j in 0 .. 2 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					elsif (Square_Number = 8) then
						for i in 7 .. 9 loop
							for j in 4 .. 6 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					elsif (Square_Number = 9) then
						for i in 6 .. 8 loop
							for j in 6 .. 8 loop
								Square (i, j) := Grid (i, j);
							end loop;
						end loop;
					end if;

					for i in 0 .. 8 loop
						if (Grid(Row, i) = Grid(Row, Col)) then
							Used_In_Row := false;
						else
							Used_In_Row := true;		
						end if;			
					end loop;

					for i in 0 .. 8 loop
						if (Grid(i, Col) = Grid(Row, Col)) then
							Used_In_Col := false;
						else
							Used_In_Col := true;		
						end if;			
					end loop;
					
					for i in 0 .. 2 loop
						for j in 0 .. 2 loop
							if (Square(i, j) = Grid(Row, Col)) then
								Used_In_Grid := false;
							else
								Used_In_Grid := true;
							end if;
						end loop;		
					end loop;

					while (Used_In_Row /= true and Used_In_Col /= true and Used_In_Grid /= true and Grid (Row, Col) < 9) loop
						Grid (Row, Col) := Grid (Row, Col) + 1;
					end loop;
					if (Grid (Row, Col) >= 9) then
						Grid (Row, Col) := 0;
						Back_Tracking := true;
					else
						Back_Tracking := false;
					end if;
			end if;
			if (Back_Tracking) then
				k := k - 1;
			else
				k := k + 1;
			end if;
		end loop;
	if (k = 81) then
		return true;
	else
		return false;
	end if;
	end Solve;

begin
	Open (File, In_File, Filename);
	
	while not End_Of_File (File) loop
		declare
			Line : constant String := Get_Line (File);
			Line_Length : constant Natural := Line'Length;
		begin
			Line_Count := Line_Count + 1;
			if (Line_Length = 9) then
				for i in 0 .. 8 loop
					Matrix (Line_Count, i) := Character'Pos(Line(i+1)) - 48;
				end loop;
			end if;
		end;
	end loop;
	
	Close (File);

	Print_Grid(Matrix);

	Sudoku_Solved := Solve(Matrix);

	Print_Grid(Matrix);
end main;


