#!/usr/bin/env bash

str_to_tran=$(ratpoison -c "prompt translate (en -> pt-br): ")
translated=$(trans -brief en:pt-br "${str_to_tran}")
ratpoison -c "echo ${translated}"
