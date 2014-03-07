#!/bin/bash
source ./sharedFunctions.sh;

# Allows interupts to break out of entire script.
# set -e; # Too forceful of an exit

recho "\n# Starting Brew Updates\n";

cecho "# Checking for outded formulae.";
brew outdated;
sayDone;

cecho "# Checking for missing formulae";
brew missing;
sayDone;

prompt_c "# Run brew update and brew upgrade?";
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		saySkipping;
	else
		cecho "\n# Updating brew.";
		brew update;
		sayDone;

		cecho "# Upgrading brew.";
		brew upgrade;
		sayDone;

		cecho "# Checking for unneeded kegs and formulae. ";
		brew cleanup -n;
		sayDone;

		prompt_c "# Run brew cleanup?"
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				saySkipping;
			else
				cecho "# Running brew cleanup";
				brew cleanup;
		fi
		sayDone;

		pecho "# Finished updating\n";
fi

prompt_c "# Run Brew Doctor?";
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		saySkipping;
	else
		cecho "\n# Performing Checkup... ";
		brew doctor;
		sayDone;
fi

sayFinished;