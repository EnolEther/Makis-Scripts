#!/bin/bash
source ./sharedFunctions.sh

# Allows interupts to break out of entire script.
# set -e; # Too forceful of an exit

cecho "# Starting Gem Update\n";

cecho "# Outded gems";
gem outdated;
pecho "Done.\n";

prompt_c "# Update ruby gems?";
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		recho "# Exiting.";
		return;
	else
		cecho "# Updating gems... ";
		gem update;
		pecho "Done.\n";

		prompt_c "# Regenerate gem Stubs?";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				recho "# Exiting.";
				return;
			else
				gem regenerate_binstubs;
				pecho "# Done.\n";
		fi
		
		prompt_c "# Rehash rbenv?";
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
