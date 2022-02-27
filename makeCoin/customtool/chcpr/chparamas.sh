#!/bin/bash

echo "메인넷 세팅할  MessageStart[0] ASCII값 입력 (기본값 : 0xfd )"
read mmsg0
echo "메인넷 세팅할  MessageStart[1] ASCII값 입력 (기본값 : 0xc2 )"
read mmsg1
echo "메인넷 세팅할  MessageStart[2] ASCII값 입력 (기본값 : 0xb8 )"
read mmsg2
echo "메인넷 세팅할  MessageStart[3] ASCII값 입력 (기본값 : 0xdd )"
read mmsg3

if [ -z $mmsg0 ] then; mmsg0="0xfd" fi
if [ -z $mmsg1 ] then; mmsg0="0xc2" fi
if [ -z $mmsg2 ] then; mmsg0="0xb8" fi
if [ -z $mmsg3 ] then; mmsg0="0xdd" fi

echo "pchMessageStart[0] = ${mmsg0};"
echo "pchMessageStart[1] = ${mmsg1};"
echo "pchMessageStart[2] = ${mmsg2};"
echo "pchMessageStart[3] = ${mmsg3};"

echo "테스트넷 MsgStart[0] ASCII값 입력 (기본값 : 0xff;)"
read tmsg0
echo "테스트넷 MsgStart[1] ASCII값 입력 (기본값 : 0xd4;)"
read tmsg1
echo "테스트넷 MsgStart[2] ASCII값 입력 (기본값 : 0xca;)"
read tmsg2
echo "테스트넷 MsgStart[3] ASCII값 입력 (기본값 : 0xf3;)"
read tmsg3

if [ -z $tmsg0 ] then; mmsg0="0xff" fi
if [ -z $tmsg1 ] then; mmsg0="0xd4" fi
if [ -z $tmsg2 ] then; mmsg0="0xca" fi
if [ -z $tmsg3 ] then; mmsg0="0xf3" fi

echo "pchMessageStart[0] = ${tmsg0};"
echo "pchMessageStart[1] = ${tmsg1};"
echo "pchMessageStart[2] = ${tmsg2};"
echo "pchMessageStart[3] = ${tmsg3};"