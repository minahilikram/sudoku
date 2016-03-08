package Sudoku_IO is
	--2D Array to store the Sudoku
	type Sudoku is Array (0 .. 8, 0 .. 8) of Integer;

	--2D Array to store the solved vs. non-solved values
	type Boolean_Grid is Array (0 .. 8, 0 .. 8) of Boolean;


	-----------------------------------
	-- Save_Sudoku_To_Grid
	-- purpose: This procedure reads in the given file and saves it to the grid and grid copy.
	-- preCondition: The grid, grid copy, and filename to be present.
	-- postCondition: A grid and grid copy is created with the given file.
	-----------------------------------
	procedure Save_Sudoku_To_Grid(Filename : in String; Grid : in out Sudoku; Grid_Copy : in out Sudoku);

	
	-----------------------------------
	-- Print_Grid
	-- purpose: Prints the given grid.
	-- preCondition: A grid filled in.
	-- postCondition: A grid is printed.
	-----------------------------------
	procedure Print_Grid(Grid : in Sudoku);
	

	-----------------------------------
	-- Find_Solved
	-- purpose: Creates the boolean grid that figures out whether the values are filled or not.
	-- preCondition: A Grid of Sudoku filled in.
	-- postCondition: Returns the created Boolean Grid.
	-----------------------------------
	function Find_Solved(Grid : Sudoku) return Boolean_Grid;

	
	-----------------------------------
	-- Is_Used_In_Row
	-- purpose: Figures out whether the given Row and Col if there's a duplicate in the row.
	-- preCondition: Requires several parameters such as the the two grids and the Row & Column.
	-- postCondition: Returns a boolean of whether if the number is avaiable for use or not.
	-----------------------------------
	function Is_Used_In_Row(Grid : in Sudoku; Grid_Copy : in Sudoku; Row : Integer; Col : Integer) return Boolean;

	function Is_Used_In_Col(Grid : in Sudoku; Grid_Copy : in Sudoku; Row : Integer; Col : Integer) return Boolean;
	
	function Is_Used_In_Grid(Grid : in Sudoku; Grid_Copy : in Sudoku; Row : Integer; Col : Integer) return Boolean;

	-----------------------------------
	-- Solve
	-- purpose: Solves the Grid by backtracking.
	-- preCondition: Required Grid and Grid_Copy
	-- postCondition: Returns a boolean of whether if the puzzle was solvable.
	function Solve(Grid : in out Sudoku; Grid_Copy : in out Sudoku) return Boolean;
end Sudoku_IO;
