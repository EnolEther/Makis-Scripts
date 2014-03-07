#!/bin/bash

#############################################################
# Font color codes to have colorful scripts.                #
# The colors are relative as the iTerm2 Soda theme I use    #
# replaces them with the themed color equivalents.          #
#############################################################
ECR="\033[0;31m";   # Red colored font
ECG="\033[0;32m";   # Green colored font
ECO="\033[0;33m";   # Orange colored font
ECBl="\033[0;34m";  # Black colored font?
ECP="\033[0;35m";   # Purple colored font
ECC="\033[0;36m";   # Blue Colored font
ECD="\033[0m";      # Defualt colored font

#####################################################################
# The following fuctions echo colored text or reset to the colors   #
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
function oecho {
  echo -e $ECO""$1""$ECD;   # Orange colored output
}
function reset_text {
  echo -ne $ECD;            # Resets text to default colors
}

###################################################
# Functions for echos that are repeatedly used.   #
###################################################
function sayDone {
  pecho "# Done.\n"
}
function saySkipping {
  recho "# Skipping\n";
}
function sayFinished {
  pecho "# Finished\n";
}
function sayExiting {
  recho "# Exiting.\n";
}

##############################################################
# Generic prompts for continuing or quiting a running script #
##############################################################
function prompt_c {
  echo -e $ECC""$1""$ECD;
  echo -ne $ECO"Type [";
  echo -ne $ECG"y";
  echo -ne $ECO"|";
  echo -ne $ECG"Y";
  echo -ne $ECO"] to continue: > "$ECD;
}
# Include warning dialog
function prompt_w {
  echo -e $ECC""$1""$ECD;
  echo -e $ECR""$2""$ECD;
  echo -ne $ECO"Type [";
  echo -ne $ECG"y";
  echo -ne $ECO"|";
  echo -ne $ECG"Y";
  echo -ne $ECO"] to continue: > "$ECD;
}

#####################################################################
# Prompt for interupting a process that requires any input to quit  #
#####################################################################
function prompt_q {
  echo -ne $ECC"# Running. Waiting for input to quit: > "$ECD;
}

#################################################################
# These functions are for announcing dir changes for the script #
# and are usually followed by a continue prompt                 #
#################################################################
function announceWorkingDir {
  echo -ne $ECC"# Working on:";
  echo -ne $ECO" $1 \n"$ECD;
}
function announceAppDir {
  echo -ne $ECC"# Starting app in:";
  echo -ne $ECO" $1 \n"$ECD;
}

#############################################################
# Prompts to change working directory                       #
# changeWorkingDir emptyVar workingDirVar                   #
# where emptyVar is an empty variable used to return the    #
#     function output.                                      #
# workingDirVar is the variable that stores the default     #
#     working directory.                                    #
# Depending on the user input the directory to be used      #
#     is passed to $emptyVar                                #
#############################################################
function changeWorkingDir {
  local __newdir=$1;
  echo -ne $ECC"# Change to a different directory?\n";
  echo -ne $ECO"Type [";
  echo -ne $ECG"y";
  echo -ne $ECO"|";
  echo -ne $ECG"Y";
  echo -ne $ECO"] to continue: > "$ECD;
  read ans
  if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
    then
      echo "";
      eval $__newdir="'$2'";
    else
      echo -ne $ECO"Enter full directory path: > "$ECD;
      read ans;
      echo "";
      eval $__newdir="'$ans'";
  fi
}










