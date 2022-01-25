#! /bin/bash

cd ..
for f in `ls` ; do 
	if [ -d $f ] ; then
		cp -r $f ../../
	fi
done
