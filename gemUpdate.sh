#!/bin/bash
ECR="\033[0;31m";
ECG="\033[0;32m";
ECY="\033[0;33m";
ECBl="\033[0;34m";
ECP="\033[0;35m";
ECC="\033[0;36m";
ECD="\033[0m";

function cecho {
	echo -e $ECC""$1""$ECD;
}
function recho {
	echo -e $ECR""$1""$ECD;
}
function pecho {
	echo -e $ECP""$1""$ECD;
}
function prompt_c {
	echo -ne $ECC"Conintue? ["
	echo -ne $ECG"y"
	echo -ne $ECC"|"
	echo -ne $ECR"n"
	echo -ne $ECC"]: > "$ECD
}
function reset_text {
	echo -ne $ECD;
}

cecho "# Starting Gem Update\n";

cecho "# Outded gems";
gem outdated;
pecho "Done.\n";

prompt_c;
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		return;
	else
		cecho "# Updating gems... ";
		gem update;
		pecho "Done.\n";

		cecho "# Regenerate gem Stubs... ";
		gem regenerate_binstubs;
		pecho "Done.\n";

		cecho "# Rehash rbenv";
		rbenv rehash;
		pecho "# Done.\n";
		pecho "# Finished\n";
fi
