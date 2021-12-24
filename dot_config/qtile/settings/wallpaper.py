from os import path
import json
from .paths import qtile_path

def load_wallpaper():
    wallpaper = "arch.png"

    wallpaper_config = path.join(qtile_path, "wallpaper.json")

    if path.isfile(wallpaper_config):
        with open(wallpaper_config, "r") as f:
            wallpaper = json.load(f)["wallpaper"]
    else:
        with open(wallpaper_config, "w") as f:
            f.write(f'{{"wallpaper": "{wallpaper}"}}')

    wallpaper_file = path.join(qtile_path, "wallpapers", wallpaper)

    if not path.isfile(wallpaper_file):
        raise Exception(f'"{wallpaper_file}" does not exist')

    return wallpaper_file

wallpaper = load_wallpaper()
