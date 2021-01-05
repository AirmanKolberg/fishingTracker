from functions import *
import pandas as pd
from datetime import date

menu_settings_list = ['Fish', 'Send Fish Report', 'Help', 'Exit']


def main_menu():
    clear_screen()
    menu_setting = 0

    print('Welcome to DataFish!  Please select from the following:\n')
    for settings in menu_settings_list:
        menu_setting += 1
        print(f"{settings} (or {menu_setting})")
    print('NOTE: This application is NOT case-sensitive.')

    selection = input('>').lower()
    if selection == 'fish' or selection == '1':
        go_fish()
    elif selection == 'send fish report' or selection == '2':
        # --------------------FINISH THE CODE HERE--------------------
        print('code this part')
    elif selection == 'help' or selection == '3':
        display_help_menu()
    elif selection == 'exit' or selection == '4':
        exit()
    else:
        print(f'{selection} is not valid, please try again.')


while True:
    main_menu()
