from os import system
from datetime import date
from webbrowser import open
from time import sleep


def clear_screen():
    _ = system('clear')


def confirm_user_in(user_in, var_being_set):
    confirmed = False
    while not confirmed:
        confirmation = input(f"Set '{user_in}' to {var_being_set}?\n").lower()
        if confirmation == 'yes':
            confirmed = True
        elif confirmation == 'no':
            user_in = input(f"{var_being_set}\n")
        else:
            print(f"{confirmation} is neither 'yes' nor 'no', please try again.")


def display_help_menu():
    clear_screen()
    print("""Welcome to the DataFish help menu!  This app's purpose is to collect fishing data to determine
the most cost-effective bait for fishing.""")
    sleep(2)
    returning_to_menu = False
    while not returning_to_menu:
        open_browser = input("Would you like to visit the page for the app's complete details?\n>").lower()
        if open_browser == 'yes':
            open("https://www.google.com")
            returning_to_menu = True
        elif open_browser == 'no':
            returning_to_menu = True
        else:
            print(f"{open_browser} is neither 'yes' nor 'no', please try again.")


def go_fish():
    class Inputs:
        def __init__(self, message):
            self.message = message
            self.variable_itself = 'N/A'

        def set_variable(self):
            user_in = input(f'{self.message}\n')
            if user_in[-2:] != '-y':
                confirm_user_in(user_in, self.message)
            self.variable_itself = user_in
            print(f"{self.message} set to {self.variable_itself}.")

        def set_boolean(self):
            boolean_set = False
            while not boolean_set:
                user_in = input(f'{self.message}\n').lower()
                if user_in == 'yes':
                    self.variable_itself = True
                    boolean_set = True
                elif user_in == 'no':
                    self.variable_itself = False
                    boolean_set = True
                else:
                    print(f"{user_in} is neither 'yes' nor 'no', please try again.")

    location = Inputs('Select location...')
    bait = Inputs('Select bait...')
    caught = Inputs('Did you catch a fish?')
    edible = Inputs('Was it large enough to eat, if desired?')

    clear_screen()
    today = str(date.today())
    location.set_variable()
    bait.set_variable()
    clear_screen()
    input("Cast away!\nPress the Return key once you've finished...")
    caught.set_boolean()
    if caught.variable_itself:
        edible.set_boolean()
    clear_screen()
    fish_again = input('Cast again?\n').lower()
    if fish_again == 'yes':
        # --------------------FINISH THE CODE HERE--------------------
        print('code this part')
    elif fish_again == 'no':
        print('Thanks for fishing today!')
