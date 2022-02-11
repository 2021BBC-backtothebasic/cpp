#!/bin/bash

FREUIT="banana"

case "$FRUIT" in 
	"apple") echo "Apple pie is quite tasty."
		;; #break
	"banana") echo "I like banana nut bread.."
		;;
	"strawberry") echo "I like strawberry milk"
		;;
esac
