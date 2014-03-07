This repository contains bash shell scripts that I have written to maintain my coding enviornment as well as my RoR applications and complex initializations like a developement webserver. They are by no means written to be failsafe and YMMV. Most of these scripts wait for user input often to allow safe breaks out of the scripts based on shell prompts. There is not any error catching included (yet).

# Script descriptions
+ sharedFunctions.sh
  + Single maintable file for variables and functions shared between scripts.
+ brewUpdate.sh
  + Runs a comprehensive update and cleanup of homebrew installation.
+ gemUpdate.sh
  + Runs a comprehensive update of installed gems and system enviornment
+ siteUpdate.sh
  + Runs a comprehensive update of the gem requirements of a RoR app. 
+ serveSite.sh # Out of date and currently unused.
  + Starts my local development webserver based on the heroku toolkit, postgresql application, and TDD packages.