from os import path
import json

#---------------------------------------------------------------
#-- Function which loads colors palette
#---------------------------------------------------------------
def load_theme():
    qtile_path = path.expanduser('~/.config/qtile/')
    theme = "nord"

    theme_config = path.join(qtile_path, "theme.json")

    if path.isfile(theme_config):
        with open(theme_config, 'r') as f:
            theme = json.load(f)["theme"]
    else:
        with open(theme_config, "w") as f:
            f.write(f'{{"theme": "{theme}"}}')

    theme_file = path.join(qtile_path, "themes", f'{theme}.json')

    if not path.isfile(theme_file):
        raise Exception(f'"{theme_file}" does not exist')

    with open(theme_file, 'r') as f:
        return json.load(f)


#---------------------------------------------------------------
#-- Define colors palette
#---------------------------------------------------------------
colors = load_theme()
