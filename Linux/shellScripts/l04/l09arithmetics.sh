#!/bin/bash

x=3
y=4

echo "x = 3, y = 4"

echo "$x+$y\n = "
let z=$x+$y
echo $z

echo "$x-$y\n = "
let z=$x-$y
echo $z

echo "else 12/5 = "
let z=12/5
echo $z
