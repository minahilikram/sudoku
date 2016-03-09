# sudoku-ada

[Sudoku](https://en.wikipedia.org/wiki/Sudoku) a backtracking implementation on Ada Algorithms.

> Sudoku is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid contains all of the digits from 1 to 9. The puzzle setter provides a partially completed grid, which for a well-posed puzzle has a unique solution.

## Install

```sh
$ git clone https://github.com/minahilikram/sudoku-ada
```

## Usage

```sh
$ cd sudoku-ada/
$ make
$ make run
```

## Limitations

- Does not solve the puzzle completely
- Does not ask user for an input file of the puzzle, to do this; change [docs/Sudoku.dat](https://github.com/minahilikram/sudoku/blob/master/docs/Sudoku.dat) to another with the same name
- Does not output solution to file

### References
- http://stackoverflow.com/questions/19969978/sudoku-solving-algorithm-with-back-tracking
- https://en.wikipedia.org/wiki/Sudoku_solving_algorithms
