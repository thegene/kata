#Problem
Given a precocious, impatient and at times impertinant boy named Jack who, when going up stairs, has a habit of stepping more than one stair at a time. Any time he goes up a flight of stairs, despite his mother telling him not to, he might step up one, two or three steps in a single bound.
If he were going up 3 stairs, he might reach the top in one step (a three stair step), two steps (a combination of one and two stairs) or three steps (three single stair steps). The resulting ways he might climb the staircase are therefore any of of these possible combinations:
- 1, 1, 1
- 1, 2
- 2, 1
- 3
giving us four possible combinations of steps. Then, given Jack, the following method would give us a response of four:
`Jack.possible_number_of_steps(3)` will return `4`.
What will `Jack.possible_number_of_steps(100)` return?
