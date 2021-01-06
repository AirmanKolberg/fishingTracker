from os import system
from datetime import date, datetime
from webbrowser import open
from time import sleep
import pandas as pd
from geocoder import ip


def clear_screen():
    _ = system('clear')


def confirm_user_in(user_in, var_being_set):
    confirmed = False
    while not confirmed:
        confirmation = input(f"Set '{user_in}' as {var_being_set.lower()}?\n").lower()
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
            # --------------------LINK TO ACTUAL DOMAIN PAGE, NOT GOOGLE--------------------
            open("https://www.google.com")
            returning_to_menu = True
        elif open_browser == 'no':
            returning_to_menu = True
        else:
            print(f"{open_browser} is neither 'yes' nor 'no', please try again.")


def go_fish():
    date_list = []
    time_list = []
    location_list = []
    coordinates_list = []
    water_type_list = []
    bait_list = []
    caught_list = []
    edible_list = []

    class Inputs:
        def __init__(self, name, message):
            self.name = name
            self.message = message
            self.variable_itself = 'N/A'

        def set_variable(self):
            user_in_set = False
            while not user_in_set:
                user_in = input(f'{self.message}\n').lower()
                if 'Type of water' in self.message:
                    if 'salt' not in user_in and 'fresh' not in user_in and 'unknown' not in user_in:
                        print('Try again...')
                    else:
                        user_in_set = True
                else:
                    user_in_set = True

            if user_in[-2:] != '-y':
                confirm_user_in(user_in, self.name)
                self.variable_itself = user_in
                print(f"{self.name} set to {self.variable_itself}.")
            else:
                user_in = user_in[:-2]
            self.variable_itself = user_in

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

    location = Inputs('Location', 'Select location...')
    water_type = Inputs('Water type', 'Type of water?  (salt, fresh, or unknown)')
    bait = Inputs('Bait', 'Select bait...')
    caught = Inputs('Caught?', 'Did you catch a fish?')
    edible = Inputs('Edible?', 'Was it large enough to eat, if desired?')

    clear_screen()
    today = str(date.today())
    location.set_variable()
    water_type.set_variable()
    bait.set_variable()

    def cast_away():
        clear_screen()
        now = datetime.now()
        current_time = now.strftime("%H:%M:%S")
        time_list.append(current_time)

        where_am_i = ip('me')
        coordinates = str(where_am_i.latlng)
        approx_location = coordinates[1:-1]
        coordinates_list.append(approx_location)

        input("Cast away!\nPress the Return/Enter key once you've finished...")
        caught.set_boolean()
        if caught.variable_itself:
            edible.set_boolean()

    def update_lists():
        date_list.append(today)
        location_list.append(location.variable_itself)
        water_type_list.append(water_type.variable_itself)
        bait_list.append(bait.variable_itself)
        caught_list.append(caught.variable_itself)
        edible_list.append(edible.variable_itself)

    def fish_current_location_and_date():
        game_over = False
        while not game_over:
            cast_away()
            update_lists()
            clear_screen()
            done_selecting = False
            while not done_selecting:
                fish_again = input('Cast again?\n').lower()
                if fish_again == 'yes':
                    while not done_selecting:
                        bait_switch = input('Change bait?\n').lower()
                        if bait_switch == 'yes':
                            bait.set_variable()
                            done_selecting = True
                        elif bait_switch == 'no':
                            done_selecting = True
                        else:
                            print(f"{bait_switch} is neither 'yes' nor 'no', please try again.")
                        print('code this part')
                elif fish_again == 'no':
                    clear_screen()
                    print('Sending fishing data...')
                    fishing_trip = {'Date': date_list,
                                    'Time': time_list,
                                    'Location': location_list,
                                    'Coordinates': coordinates_list,
                                    'Water Type': water_type_list,
                                    'Bait': bait_list,
                                    'Caught?': caught_list,
                                    'Edible?': edible_list
                                    }
                    df = pd.DataFrame(fishing_trip, columns=['Date', 'Time', 'Location', 'Water Type', 'Bait', 'Caught?', 'Edible?'])
                    df.to_csv('fishingData.csv')
                    # Send CSV to remote server
                    print('Thanks for fishing today!')
                    exit()
                else:
                    print(f"{fish_again} is neither 'yes' nor 'no', please try again.")

    fish_current_location_and_date()
