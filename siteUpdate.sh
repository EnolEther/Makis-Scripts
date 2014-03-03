#!/bin/bash
ECR="\033[0;31m";
ECG="\033[0;32m";
ECY="\033[0;33m";
ECBl="\033[0;34m";
ECP="\033[0;35m";
ECC="\033[0;36m";
ECD="\033[0m";
SDIR=$PWD;
UDIR=/Users/jmakis/Ruby/mywebsite;

function cecho {
	echo -e $ECC""$1""$ECD;
}
function recho {
	echo -e $ECR""$1""$ECD;
}
function pecho {
	echo -e $ECP""$1""$ECD;
}

function announceUDIR {
	echo -ne $ECC"# Updating:";
	echo -ne $ECY" "$UDIR"\n"$ECD;
}

function prompt_c {
	echo -ne $ECC"# Conintue? [";
	echo -ne $ECG"y";
	echo -ne $ECC"|";
	echo -ne $ECR"n";
	echo -ne $ECC"]: > "$ECD;
}

function reset_text {
	echo -ne $ECD;
}

cecho "# Starting site dependency update\n";
announceUDIR;
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
