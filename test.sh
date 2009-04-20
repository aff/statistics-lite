#!/bin/bash

# ../rakudo/perl6 lib/Statistics/Lite.pm

export PARROT_DIR=/home/aff/test/perl6/rakudo/parrot
export RAKUDO_DIR=/home/aff/test/perl6/rakudo

#export PERL6LIB=../rakudo/
export PERL6LIB=lib


#   ../rakudo/perl6 t/*.t does seem to open the first file only

for FILE in `ls t/*.t`
do 
  echo "$FILE"
  ../rakudo/perl6 $FILE
done
