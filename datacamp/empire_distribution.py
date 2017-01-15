#!/usr/bin/env python

##########################################
#
# empire_distribution.py: Simple python script to simulate distribution of steps in Empire State Building game
# The game consists in a bet: you are with a friend at the Empire State Building and roll a dice:
# if you get number 1 or 2, you go down by one step, if you get 3, 4 or 5 you go up by 1 step. 
# If you get 6, you have to roll the dice again and will go up by as many steps as the resulting number.
# Note: you are a bit clumsy and you have 0.1% chance of falling down.
# What are the odds that you'll reach 60 steps high on the Empire State Building after 100 times rolling the dice?
#
# Date: 15/01/2017
#
# Exercise on datacamp.com - Intermediate Python for Data Science
#
#########################################

# Initialization
import matplotlib.pyplot as plt
import numpy as np
np.random.seed(123)

# Initialize all_walks
all_walks = []

# Simulate random walk 1000 times
for i in range(1000) :

    # Code from empire_game.py
    random_walk = [0]
    for x in range(100) :
        step = random_walk[-1]
        dice = np.random.randint(1,7)

        if dice <= 2:
            step = max(0, step - 1)
        elif dice <= 5:
            step = step + 1
        else:
            step = step + np.random.randint(1,7)
            
        # Implement clumsiness
        if np.random.rand() <= 0.001 :
            step = 0
            
        random_walk.append(step)

    # Append random_walk to all_walks
    all_walks.append(random_walk)

# Convert all_walks to Numpy array: np_aw
np_aw = np.array(all_walks)

# Only for exercise purposes:
## Plot np_aw and show
# plt.plot(np_aw)
# plt.show()
# 
## Clear the figure
# plt.clf()

# Transpose np_aw: np_aw_t (otherwise python misunderstands)
np_aw_t = np.transpose(np_aw)

# Plot np_aw_t and show
plt.plot(np_aw_t)
plt.show()

# Clear the figure
plt.clf()

# Plot histogram of the end points of all the random walks:
# Select last row from np_aw_t: ends
ends = np_aw_t[-1]

# Plot histogram of ends, display plot
plt.hist(ends)
plt.show()

# Compute the chance to reach 60 steps high if playing the Empire State Building game --> 78.80 %
p_win = (np.count_nonzero(ends[ends >= 60]) / 1000) * 100
print(p_win)