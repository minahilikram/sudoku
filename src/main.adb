with Ada.Text_IO; use Ada.Text_IO;

procedure main is

	Filename   : String := "../docs/Sudoku.dat";
	File       : File_Type;
	Line_Count : Integer := 0;
	Sudoku: Array (1..9, 1..9) of Integer;

	Row : Integer := 0;
	Column : Integer := 0;

begin
	Open (File, In_File, Filename);
	
	while not End_Of_File (File) loop
		declare
			Line : String := Get_Line (File);
			Line_Length : constant Natural := Line'Length;
		begin
			Line_Count := Line_Count + 1;
			if (Line_Length = 9) then
				for i in 1 .. Line_Length loop
					Sudoku (Line_Count, i) := Character'Pos(Line(i)) - 48;
				end loop;
			end if;
		end;
	end loop;
	
	Close (File);

	Put_Line ("+------+------+------+");
	Put ("|");
	for i in 1 .. 9 loop --rows
		if (Row = 3) then
			Put_Line ("+------+------+------+");
			Row := 0;
		end if;
		Row := Row + 1;
		for j in 1 .. 9 loop --columns
			if (Column = 3) then
				Put ("|");
				Column := 0;
			end if;
			Column := Column + 1;

			if ((j mod 9) = 0) then
				Put_Line (Natural'Image (Sudoku(i, j)) & "|");
			else
				Put (Natural'Image (Sudoku(i, j)));
			end if;
		end loop;	
	end loop;

	Put_Line ("+------+------+------+");


	for i in 1 .. 9 loop --rows
		for i in 1 .. 9 loop --columns
			if (Sudoku (i, j) = 0) then
				Sudoku (i, j) := i;
				if ()
			end if;
		end loop;
	end loop;

end main;
