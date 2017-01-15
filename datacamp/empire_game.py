#!/usr/bin/env python

##########################################
#
# empire_game.py: Simple python script to simulate rolling a dice and deciding steps to climb in Empire State Building based on the output
# Date: 14/01/2017
#
# Exercise on datacamp.com - Intermediate Python for Data Science
#
#########################################

# Import numpy and set seed
import numpy as np
np.random.seed(123)

# Initialize random_walk
random_walk = [0]

for x in range(100) :
    step = random_walk[-1]
    dice = np.random.randint(1,7)

    if dice <= 2:
        # Use max to make sure step can't go below 0
        step = max(0, step - 1)
    elif dice <= 5:
        step = step + 1
    else:
        step = step + np.random.randint(1,7)

    random_walk.append(step)

print(random_walk)

import matplotlib.pyplot as plt

# Plot random_walk
plt.plot(random_walk)

# Show the plot
plt.show()