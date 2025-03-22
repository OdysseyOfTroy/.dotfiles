#!/usr/bin/env bash

if command -v rustup &> /dev/null; then
    printf " rustup has already been installed"
else 
    printf " Installing rustup"
    curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
fi
