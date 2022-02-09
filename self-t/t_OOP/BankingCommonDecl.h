/*BankingCommonDecl.h*/
#ifndef __BANKING_COMMON_H__
#define __BANKING_COMMON_H__

#include <iostream>
#include <cstring>
#include <cstdlib>

using namespace std;
const int NAME_LEN=20;

// menu of user choice 
enum { MAKE=1, DEPOSIT, WITHDRAW, INQUIRE, EXIT};
// grade
enum {LEVEL_A=7, LEVEL_B=4, LEVEL_C=2};
// kinds of account
enum {NORMAL=1, CREDIT=2};


#endif
