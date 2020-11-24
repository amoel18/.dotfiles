#!/usr/bin/python
import i3ipc
import sys

import gi
gi.require_version("Gio", "2.0")
from gi.repository import Gio

ipc = i3ipc.Connection()

def create_app_search_result(app):
    return 'launch: {}: {}'.format(app.get_name(), app.get_description()) if app.get_description() != None else "launch: {}".format(app.get_name())

def create_window_search_result(win):
    return "window: {}".format(win.name)

def get_executable(search_term):
    for binary in map(lambda app: app.get_executable() if app.get_executable() != '/usr/bin/flatpak' else app.get_commandline(), filter(lambda app: create_app_search_result(app).strip() == search_term, Gio.AppInfo.get_all())):
        ipc.command('exec {}'.format(binary))

def list_apps():
    print(*map(create_app_search_result, filter(lambda app : app.should_show(), Gio.AppInfo.get_all())), sep="\n")

def list_windows():
    print(*map(create_window_search_result, filter(lambda item: item.type == "con" and item.app_id != "tofi" and item.name != None, ipc.get_tree())), sep="\n")

def focus_app(search_term):
    # Should only be one, map doesn't work when used in "launcher" window
    for window in filter(lambda item: create_window_search_result(item) == search_term, ipc.get_tree()):
        window.command('focus')

if __name__ == "__main__":
    if not sys.stdin.isatty():
        for line in sys.stdin:
            get_executable(line.strip())
            focus_app(line.strip())
    else:
        list_apps()
        list_windows()