#!/usr/bin/env python

from hyprsocket import run_on_line


def get_kb_layout(line):
    if "activelayout" in line:
        res = line.split(">>")[1]
        language = res.split(",")[1]
        lang_short = language[0:2]
        print("bg" if lang_short == "Bu" else "en", flush=True)


run_on_line(get_kb_layout)
