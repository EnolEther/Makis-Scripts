#!/bin/bash
source ./sharedFunctions.sh

# Allows interupts to break out of entire script.
# set -e; # Too forceful of an exit

SDIR=$PWD;
UDIR=/Users/jmakis/Ruby/mywebsite;

cecho "# Starting site dependency update\n";
announceWorkingDir $UDIR;
prompt_c;
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		recho "# Exiting.";
		cd $SDIR;
		return;
	else
		cd $UDIR;
		cecho "\n# Checking for missing gems";
		bundle check;
		pecho "# Done \n";

		cecho "# Install missing gems";
		prompt_c;
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Continuing\n";
			else
				pecho "\n# Running bundle install --binstubs...\n";
				bundle install --binstubs=./bundler_stubs;
				pecho "# Done \n";
		fi

		cecho "# Checking for outdated gems";
		bundle outdated;
		pecho "# Done \n";

		cecho "# Update outdated gems";
		prompt_c;
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Continuing\n";
			else
				cecho "\n# Upgrading outdated gems";
				bundle update;
				pecho "# Done \n";
		fi

		cecho "# Run bundler install again?";
		prompt_c;
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Continuing\n";
			else
				pecho "\n# Running bundle install --binstubs...\n";
				bundle install --binstubs=./bundler_stubs;
				pecho "# Done \n";
		fi

		cecho "# Clean bundled gems?\n";
		recho "# Will run bundle clean --force";
		prompt_c;
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Exiting.";
				cd $SDIR;
				return;
			else
				pecho "\n# Cleaning\n";
				bundle clean --force;
				pecho "# Done \n";
		fi
		cd $SDIR;
fi
