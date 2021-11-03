# The_Game_of_Life


The Game of Life is a 2D cellular automaton on a square grid. Cells in the grid can only assume two states: dead or alive (think, for example, of bacteria). It is traditional to color the dead cells white and the alive cells black. After much experimentation, Conway chose the following simple rules that allow small seed configurations to produce complicated behavior, but without exponential growth. These same rules apply to all cells and do not change from generation to generation:
1. A cell that is alive, with exactly 0 or 1 neighbors that are also alive in the current generation, is dead in the next generation (death from underpopulation)
2. A cell that is alive, with exactly 2 or 3 neighbors that are also alive in the current generation, is alive in the next generation. (survival)
3. A cell that is alive, with 4 or more neighbors that are also alive in the current generation, is dead in the next generation (death from overpopulation)
4. A cell that is dead, with exactly 3 neighbors that are alive in the current generation, is alive in the next generation (birth by reproduction)


And, of course, a cell that is dead, with either fewer or more than 3 neighbors that are also alive in the current generation, is also dead in the next generation.



For this assignment, I implemented the Game of Life for a 7 × 7 universe with periodic boundary conditions. As a seed configuration, I used the glider. It is an example of a spaceship, a pattern that changes shape and moves across the universe, but returns to its original shape after a certain number of generations. The glider has a period of 4 (the period being the smallest number of generations for a shape to reoccur). 
