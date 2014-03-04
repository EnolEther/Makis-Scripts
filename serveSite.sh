#!/bin/bash
source ./sharedFunctions.sh

ADIR=/Users/jmakis/Ruby/mywebsite;
SDIR=$PWD;

cecho "# Booting Webservers\n";

announceAppDir $ADIR;
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