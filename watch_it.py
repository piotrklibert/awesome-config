#! /bin/env python
import datetime
import re
import subprocess
import sys
import time
import os
from fnmatch import fnmatch
from pathlib import Path as P

try:
    import pyinotify as ino
except ImportError:
    print()
    print("Error: no `pyinotify` lib. To use this script, install it with:")
    print()
    print("\tpip install pyinotify")
    print()
    exit()


LAST_RECOMPILE_TIME = 0
THROTTLE_TIMER = datetime.datetime.now()

DEFAULT_EXCLUDE_PATTERNS = ["flymake_", "flycheck_", r"\.#.*", "#.*#", "^tmp.*"]


def make_handler(includes, action_callback, excludes=DEFAULT_EXCLUDE_PATTERNS):
    class _Handler(ino.ProcessEvent):
        def match_event(self, event):
            evpath, name = event.pathname, event.name

            if P(event.pathname) == P(__file__).absolute():
                raise RuntimeError("Needs restart!")

            for include_pattern in includes:
                if "__pycache__" in evpath:  # short-circuit for common cases
                    return False
                if fnmatch(name, include_pattern) and not any(re.search(ex, name) for ex in excludes):
                    return True
                else:
                    return False
            return False

        def process_default(self, event):
            global THROTTLE_TIMER
            # print(event.pathname, event.maskname)
            if self.match_event(event):
                cooldown = THROTTLE_TIMER + datetime.timedelta(seconds=1+LAST_RECOMPILE_TIME)
                if (cooldown < datetime.datetime.now()):
                    action_callback(event)
                    THROTTLE_TIMER = datetime.datetime.now()
                    return
    return _Handler()


from glob import glob


def recompile(event=None):
    global LAST_RECOMPILE_TIME
    print("\n------\n")

    if event:
        args = [event.pathname]
    else:
        args = [os.getcwd() + "/" + x for x in glob("*.moon")]

    start = time.time()
    ret = subprocess.call(["/home/cji/priv/moonscript/awesomescript/bin/moonc"] + args)
    if ret != 0:
        subprocess.call(["noti", "-t", "Compilation Failed!"])
        subprocess.call(["zsh", "-c", "source ~/.zshrc; boing-boing"])
    else:
        fpath = "..."+args[0][-45:]
        subprocess.call(["noti", "-m", f"Compiled {fpath}", "-t", "Moonscript(moonc): OK"])

    stop = time.time()

    LAST_RECOMPILE_TIME = stop - start
    print("\n======\n\n")
    print(LAST_RECOMPILE_TIME, event)


if __name__ == "__main__":
    autostart = 1
    patterns = ["*.moon"]
    mask = (ino.IN_MODIFY | ino.IN_CREATE | ino.IN_MOVED_TO)  # TODO: ?
    wm = ino.WatchManager()

    wm.add_watch(os.getcwd(), mask, rec=True)
    wm.add_watch(os.getcwd()+"/widgets/volume/", mask, rec=True)
    wm.add_watch(os.getcwd()+"/widgets/brightness/", mask, rec=True)
    wm.add_watch("/home/cji/privmoonscript/awesomescript/bin/moonc", mask, rec=True)

    notifier = ino.Notifier(wm, make_handler(patterns, recompile))

    try:
        print()
        print("Watch started\n")
        if autostart:
            recompile(None)
        notifier.loop()
    except RuntimeError as ex:
        # TODO: os.execv ourselves here
        print(ex.args and ex.args[0])
