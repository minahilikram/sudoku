with Ada.Text_IO; use Ada.Text_IO;
with Sudoku_IO; use Sudoku_IO;

procedure Main is

	Filename : constant String := "../docs/Sudoku.dat";
	Grid : Sudoku;
	Grid_Copy : Sudoku;

	Sudoku_Solved : Boolean := false;
begin
	New_Line;
	Put_Line ("Welcome to Sudoku Solver!");
	New_Line;

	Save_Sudoku_To_Grid(Filename, Grid, Grid_Copy);

	Sudoku_Solved := Solve(Grid, Grid_Copy);

	if (Sudoku_Solved) then
		Put_Line ("Sudoku Solved!");

		Print_Grid(Grid);
	else
		Put_Line ("No Solution Found.");
	end if;
	
end Main;
