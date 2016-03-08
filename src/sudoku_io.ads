package Sudoku_IO is
	type Sudoku is Array (0 .. 8, 0 .. 8) of Integer;
	type Boolean_Grid is Array (0 .. 8, 0 .. 8) of Boolean;

	procedure Save_Sudoku_To_Grid(Filename : in String; Grid : in out Sudoku; Grid_Copy : in out Sudoku);

	procedure Print_Grid(Grid : in Sudoku);
	
	function Find_Solved(Grid : Sudoku) return Boolean_Grid;

	function Is_Used_In_Row(Grid : in Sudoku; Grid_Copy : in Sudoku; Row : Integer; Col : Integer) return Boolean;

	function Is_Used_In_Col(Grid : in Sudoku; Grid_Copy : in Sudoku; Row : Integer; Col : Integer) return Boolean;
	
	function Is_Used_In_Grid(Grid : in Sudoku; Grid_Copy : in Sudoku; Row : Integer; Col : Integer) return Boolean;

	function Solve(Grid : in out Sudoku; Grid_Copy : in out Sudoku) return Boolean;
end Sudoku_IO;
