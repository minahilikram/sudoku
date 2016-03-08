with Ada.Text_IO; use Ada.Text_IO;
with Sudoku_IO; use Sudoku_IO;


-----------------------------------
-- Program that solves Sudoku Puzzles
-----------------------------------
procedure Main is

	--Sudoku File to read from
	Filename : constant String := "../docs/Sudoku.dat";

	--Grid that holds the Sodoku Grid	
	Grid : Sudoku;
	
	--Copy of the grid for solving
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
