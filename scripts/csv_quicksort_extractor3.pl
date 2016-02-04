#!/usr/bin/perl

use strict;

my($line);
my($size,$seed,$level);
my($seq,$par,$libc);
print "Size, Seed, Level, Seq, Par, Libc\n" ;
while($line=<>) {
    chomp $line;

    if($line =~/Args: (\d+) (\d+) (\d+)$/) {
        $size = $1;
        $seed = $2;
        $level = $3;
        next;
    }
    if($line =~/^Sequential quicksort.*: ([\d\.]*) sec.$/) {
        $seq=$1; next;
    }
    if($line =~/^Parallel quicksort.*: ([\d\.]*) sec.$/) {
        $par=$1; next;
    }
    if($line =~/^Built-in quicksort.*: ([\d\.]*) sec.$/) {
        $libc=$1;
        print "$size, $seed, $level, $seq, $par, $libc\n";
        next;
    }
}
