#!/bin/bash

#############################################################
# Font color codes to have colorful scripts.                #
# The colors are relative as the iTerm2 Soda theme I use    #
# replaces them with the themed color equivalents.          #
#############################################################
ECR="\033[0;31m";   # Red colored font
ECG="\033[0;32m";   # Green colored font
ECY="\033[0;33m";   # Yellow colored font
ECBl="\033[0;34m";  # Black colored font?
ECP="\033[0;35m";   # Purple colored font
ECC="\033[0;36m";   # Blue Colored font
ECD="\033[0m";      # Defualt colored font

#####################################################################
# The following fuctions echo colored text and reset to the colors  #
#####################################################################
function cecho {
  echo -e $ECC""$1""$ECD;   # Blue colored output
}
function recho {
  echo -e $ECR""$1""$ECD;   # Red colored output
}
function pecho {
  echo -e $ECP""$1""$ECD;   # Purple colored output
}
function yecho {
  echo -e $ECY""$1""$ECD;   # Yellow colored output
}
function reset_text {
  echo -ne $ECD;            # Resets text to default colors
}

##############################################################
# Generic prompts for continuing or quiting a running script #
##############################################################
function prompt_c {
  echo -ne $ECC"Type ["
  echo -ne $ECG"y"
  echo -ne $ECC"|"
  echo -ne $ECG"Y"
  echo -ne $ECC"] to continue: > "$ECD
}
# Prompt for interupting a process that requires any input to quit
function prompt_q {
  echo -ne $ECC"# Running. Waiting for input to quit: > "$ECD;
}

#################################################################
# These functions are for announcing dir changes for the script #
# and are usually followed by a continue prompt                 #
#################################################################
function announceWorkingDir {
  echo -ne $ECC"# Working on:";
  echo -ne $ECY" $1 \n"$ECD;
}
function announceAppDir {
  echo -ne $ECC"# Starting app in:";
  echo -ne $ECY" $1 \n"$ECD;
}