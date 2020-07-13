#!/usr/bin/env python3.8

import asyncio

async def run(cmd):
    proc = await asyncio.create_subprocess_shell(
        cmd,
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE)

    stdout, stderr = await proc.communicate()

    print(f'[{cmd!r} exited with {proc.returncode}]')

    if stdout:
        print(f'[stdout]\n{stdout.decode()}')

    if stderr:
        print(f'[stderr]\n{stderr.decode()}')


widgets = dict(
    memory='free -m | grep -i mem | grep -oP "\d+" | head -n2',
    date='date +"%H:%M %F"',
    volume='amixer get Master | grep -oP "\[\d+" | head -n1 | tr -d "["',
    music='mpris2controller Metadata | jq \'.["xesam:title"]\' | tr -d \'"\'',
)


async def dispatch():
    await asyncio.gather(
        *[run(widgets[widget]) for widget in widgets]
    )

    await asyncio.sleep(1)

asyncio.run(dispatch())
