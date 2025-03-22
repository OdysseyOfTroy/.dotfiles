#!/usr/bin/env bash

# Get Homebrew/bundle before trying to use it
printf "Tapping homebrew/bundle"
brew tap homebrew/bundle

# Install all taps, formulae, and casks from the Brewfile
printf "Installing Homebrew packages"
brew bundle install --all --cleanup --file _homebrew/Brewfile
