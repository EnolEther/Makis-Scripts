#!/bin/bash
ADIR=/Users/jmakis/Ruby/mywebsite;
SDIR=$PWD;

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
function yecho {
	echo -e $ECY""$1""$ECD;
}

function announceADIR {
	echo -ne $ECC"# Starting app in:";
	echo -ne $ECY" "$ADIR"\n"$ECD;
}

function prompt_c {
	echo -ne $ECC"# Conintue? [";
	echo -ne $ECG"y";
	echo -ne $ECC"|";
	echo -ne $ECR"n";
	echo -ne $ECC"]: > "$ECD;
}

function prompt_q {
	echo -ne $ECC"# Running. Waiting for input to quit: > "$ECD;
}

function reset_text {
	echo -ne $ECD;
}

cecho "# Booting Webservers\n";
announceADIR;
prompt_c;
read ans;
if [ "$ans" != "y" ] && [ "$ans" != "Y" ]
	then
		recho "# Exiting.";
		cd $SDIR;
		return;
	else
		cd $ADIR
		cecho "# Starting server...";
		foreman start;
		# pecho "# Done.\n";

		# prompt_q;
		# read;

		# recho "# Shutting down Webservers\n";
		# kill `cat tmp/pids/server.pid`;
		# pecho "# Done.\n";
fi

pecho "# Finished\n";
cd $SDIR;