#!/bin/bash
source ./sharedFunctions.sh

# Allows interrupts to break out of entire script.
# set -e; # Too forceful of an exit

recho "\n# Starting Gem Update. \n";

cecho "# Outdated gems";
gem outdated;
sayDone;

prompt_c "# Update ruby gems?";
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		saySkipping;
	else
		cecho "\n# Updating gems... ";
		gem update;
		sayDone;

		# needs rubygems-bundler
		# gem install rubygems-bundler
		# prompt_c "# Regenerate gem Stubs?";
		# read ans;
		# if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
		# 	then
		# 		saySkipping;
		# 	else
		# 		gem regenerate_binstubs;
		# 		sayDone;
		# fi
		
		prompt_c "# Rehash rbenv?";
		read ans;
		if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
			then
				saySkipping;
			else
				rbenv rehash;
				sayDone;
		fi
fi
sayFinished;
