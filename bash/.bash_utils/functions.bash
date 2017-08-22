#!/usr/bin/env bash


function work-screen() {
    screen -d -m -S $(pwd| rev | cut -d/ -f1 | rev)
}
