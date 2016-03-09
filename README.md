# sudoku-ada

[Sudoku](https://en.wikipedia.org/wiki/Sudoku) a backtracking implementation using Ada Algorithms.

> Sudoku backtracking algorithm is one that iterates all the possible solutions for the given sudoku. If the solutions assigned do not lead to the solution of Sudoku, the algorithm discards the solutions and rollbacks to the original solutions and retries again and hence the name backtracking.

## Install

```sh
$ git clone https://github.com/minahilikram/sudoku
```

## Usage

```sh
$ cd sudoku/
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
