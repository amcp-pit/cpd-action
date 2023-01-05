#!/bin/bash

# FILES=`find -regex '.*\.\(cpp\|h\)' | grep -v '.*/\..*'`

AUTHOR=`echo $1 | awk '{n=split($1,A,"-"); print A[n]}'`

for f in $(find -regex '.*\.\(cpp\|h\)' | grep -v '.*/\..*'); do 
  curl https://cpd.apmath.info/check.php -F owner=$2 -F fileid=$1 -F author=$AUTHOR -F file=@$f 
done

echo "checks-failed=0" >> $GITHUB_OUTPUT
