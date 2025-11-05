#!/usr/bin/python
import json
from subprocess import check_output

workspaces = json.loads(check_output(["i3-msg", "-t", "get_workspaces"]))
focused_num = next(ws["num"] for ws in workspaces if ws["focused"])
workspace_nums = [ws["num"] for ws in workspaces]

for next_num in range(1, 11):  # 1–10
    if next_num > focused_num and next_num not in workspace_nums:
        print(next_num)
        break
