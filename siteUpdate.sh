#!/bin/bash
source ./sharedFunctions.sh

# Allows interupts to break out of entire script.
# set -e; # Too forceful of an exit

SDIR=$PWD;
UDIR=/Users/jmakis/Ruby/mywebsite;

cecho "# Starting site dependency update\n";

announceWorkingDir $UDIR;
changeWorkingDir NDIR $UDIR;

prompt_c "# Work on $NDIR?";
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		recho "# Exiting.\n";
		cd $SDIR;
		return;
	else
		cd $NDIR;
		cecho "\n# Checking for missing gems";
		bundle check;
		pecho "# Done \n";

		cecho "# Checking for outdated gems";
		bundle outdated;
		pecho "# Done \n";

		prompt_c "# Update gems?";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Skipping\n";
			else
				cecho "\n# Updating outdated gems";
				bundle update;
				pecho "# Done \n";
		fi

		prompt_c "# Run bundler install and update binstubs?";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Skipping\n";
			else
				pecho "\n# Running bundle install --binstubs...\n";
				bundle install --binstubs=./bundler_stubs;
				pecho "# Done \n";
		fi

		prompt_w "# Clean bundled gems?" "# Will run bundle clean --force";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Skipping.";
				cd $SDIR;
				return;
			else
				pecho "\n# Cleaning\n";
				bundle clean --force;
				pecho "# Done \n";
		fi
		cd $SDIR;
		pecho "# Done \n";
fi
