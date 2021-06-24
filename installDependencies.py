"""
You can also use pip install -r requirements.txt,
but who am I to tell you what to do?  🤙🏼
"""

from subprocess import check_output
from os import system

pips = ['pip', 'pip3']
dependency_list = ['pandas', 'geocoder']


def bash_command(user_in):
    _ = system(user_in)


def clear_screen():
    bash_command('clear')


clear_screen()
pip_installed = False
while not pip_installed:
    for pip in pips:
        try:
            output = check_output(f'{pip} --version', shell=True)
            pip_on_this_machine = pip
            pip_installed = True
            break
        except Exception:
            pip_installed = False
installed_dependencies = ''
for dependencies in dependency_list:
    bash_command(f'{pip} install {dependencies}')
    installed_dependencies += f'{dependencies}\n'

clear_screen()
print(f'All dependencies are installed:\n{installed_dependencies}')
