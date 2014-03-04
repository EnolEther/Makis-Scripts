#!/bin/bash
source ./sharedFunctions.sh;

# Allows interupts to break out of entire script.
# set -e; # Too forceful of an exit

cecho "# Starting Brew Updates\n";

cecho "# Outded formulae";
brew outdated;
pecho "Done.\n";

cecho "# Missing formulae";
brew missing;
pecho "Done.\n";

prompt_c;
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		return;
	else
		cecho "\n# Updating brew... ";
		brew update;
		pecho "# Done.\n"

		cecho "# Upgrading brew... ";
		brew upgrade;
		pecho "# Done.\n"

		cecho "# Cleaning brew... ";
		brew cleanup;
		pecho "# Done.\n"

		pecho "# Finished\n";
fi

cecho "# Run Brew Doctor?";
prompt_c;
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		return;
	else
		cecho "\n# Performing Checkup... ";
		brew doctor;
		pecho "# Done.\n"
fi
