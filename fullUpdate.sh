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

cecho "# Starting Update Routine\n";

. brewUpdate.sh;

. gemUpdate.sh;

. siteUpdate.sh;
