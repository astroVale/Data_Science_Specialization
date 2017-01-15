# Hacker Statistics: Empire State Building game
Repository for the python scripts implemented in the last chapter of the Intermediate Python for Data Science on [datacamp.com](https://datacamp.com)

## Empire State Building game
The game consists in a bet: you are with a friend at the Empire State Building and roll a dice:
- if you get number 1 or 2, you go down by one step
- if you get 3, 4 or 5 you go up by 1 step 
- if you get 6, you have to roll the dice again and will go up by as many steps as the resulting number.

Note: you are a bit clumsy and you have 0.1% chance of falling down.

## Final problem: What are the odds that you'll reach 60 steps high on the Empire State Building after 100 times rolling the dice?

###  Scripts: 
1. "empire_game.py" -> One simulation of the game, containing a single randome walk
2. "empire_distribution.py" -> Distribution of 1000 simulations of the game, used for computing the chance of winning the game bet
3. "Empire_State_game.ipynb" -> corresponding of empire_distribution.py in Jupiter Notebook
