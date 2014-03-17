#!/bin/bash
source ./sharedFunctions.sh

## Allows interrupts to break out of entire script.
# set -e; # Too forceful of an exit

SDIR=$PWD;
UDIR=/Users/jmakis/Ruby/mywebsite;

recho "\n# Starting site dependency update. \n";

announceWorkingDir $UDIR;
changeWorkingDir NDIR $UDIR;

prompt_c "# Work on $NDIR?";
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		sayExiting;
		cd $SDIR;
		return;
	else
		cd $NDIR;
		
		prompt_c "\n# Check for missing & outdated gems?";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				saySkipping;
			else
				cecho "# Checking for missing gems.";
				bundle update;
				sayDone;
				bundle check;
				sayDone;
				cecho "# Checking for outdated gems.";
				bundle outdated;
				sayDone;
		fi
		

		prompt_c "# Update gems?";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				saySkipping;
			else
				cecho "\n# Updating outdated gems.";
				bundle update;
				sayDone;
		fi

		prompt_c "# Run bundler install and update binstubs?";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				saySkipping;
			else
				pecho "\n# Running bundle install --binstubs. \n";
				bundle install --binstubs=./bundler_stubs;
				sayDone;
		fi

		prompt_w "# Clean bundled gems?" "# Will run bundle clean --force.";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				saySkipping;
			else
				pecho "\n# Cleaning \n";
				bundle clean --force;
				sayDone;
		fi

		prompt_c "# Remain in working directory?";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				cd $SDIR
				sayDone;
			else
				cd $NDIR;
				sayDone;
		fi
fi
sayFinished;