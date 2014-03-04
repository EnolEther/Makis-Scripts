#!/bin/bash
source ./sharedFunctions.sh

# Allows interupts to break out of entire script.
# set -e; # Too forceful of an exit

cecho "# Starting Gem Update\n";

cecho "# Outded gems";
gem outdated;
pecho "Done.\n";

prompt_c;
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		recho "# Exiting.";
		return;
	else
		cecho "# Updating gems... ";
		gem update;
		pecho "Done.\n";

		cecho "# Regenerate gem Stubs?";
		prompt_c;
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Exiting.";
				return;
			else
				gem regenerate_binstubs;
				pecho "Done.\n";
		fi
		
		cecho "# Rehash rbenv?";
		prompt_c;
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Exiting.";
				return;
			else
				rbenv rehash;
				pecho "# Done.\n";
		fi
		pecho "# Finished\n";
fi
