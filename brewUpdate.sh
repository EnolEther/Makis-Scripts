#!/bin/bash
source ./sharedFunctions.sh;

# Allows interupts to break out of entire script.
# set -e; # Too forceful of an exit

cecho "# Starting Brew Updates\n";

cecho "# Checking for outded formulae.";
brew outdated;
pecho "Done.\n";

cecho "# Checking for missing formulae";
brew missing;
pecho "Done.\n";

prompt_c "# Run brew update and brew upgrade?";
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		return;
	else
		cecho "\n# Updating brew.";
		brew update;
		pecho "# Done.\n"

		cecho "# Upgrading brew.";
		brew upgrade;
		pecho "# Done.\n"

		cecho "# Checking for unneeded kegs and formulae. ";
		brew cleanup -n;
		pecho "# Done.\n"

		prompt_c "# Run brew cleanup?"
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				return;
			else
				cecho "# Running brew cleanup";
				brew cleanup;
		fi
		pecho "# Done.\n"

		pecho "# Finished updating\n";
fi

prompt_c "# Run Brew Doctor?";
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		return;
	else
		cecho "\n# Performing Checkup... ";
		brew doctor;
		pecho "# Done.\n"
fi
