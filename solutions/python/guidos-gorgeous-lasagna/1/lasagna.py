"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""


#TODO: define the 'EXPECTED_BAKE_TIME' constant.
EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2

#TODO: Remove 'pass' and complete the 'bake_time_remaining()' function below.
def bake_time_remaining( elapsed_bake_time=0 ):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


#TODO: Define the 'preparation_time_in_minutes()' function below.
# You might also consider using 'PREPARATION_TIME' here, if you have it defined.
def preparation_time_in_minutes( layers=0 ): 
    """Calculate the time to prep the lasagna.

    :param layers: int - number of layers in the lasagna.
    :return: int - time to prep using PREPARATION_TIME as the time per layer.

    Function that takes the number of layers in the lasagna and
    returns the total prep time based on `PREPARATION_TIME`.
    """
    return PREPARATION_TIME * layers


#TODO: define the 'elapsed_time_in_minutes()' function below.
# Remember to add a docstring (you can copy and then alter the one from bake_time_remaining.)
def elapsed_time_in_minutes( layers=0, elapsed_bake_time=0 ): 
    """Calculate the elapsed bake time.

    :param layers: int - number of layers in the lasagna.
    :param elapsed_bake_time: int - number of minutes already passed in the oven.
    :return: int - time elapsed to prepare and cook the lasagna.

    Function that takes the number of layers in the lasagna and time passed already
    returns the total time passed to prep and cook.
    """
    return preparation_time_in_minutes(layers) + elapsed_bake_time
