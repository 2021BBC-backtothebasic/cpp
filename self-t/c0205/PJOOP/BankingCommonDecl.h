//BankingCommonDecl.h

#ifndef __BANKING_COMMON_H__
#define __BANKING_COMMON_H__

#include <iostream>
#include <cstring>

using namespace std;
const int NAME_LEN=20;

// USER OPTION
enum {MAKE=1, DEPOSIT, WITHDRAW, INQUIRE, EXIT};

// USER GRADE
enum {LEVEL_A = 7, LEVEL_B = 4, LEVEL_C = 2 } ;

// ACCOUNT Types
enum {NORMAL = 1, CREDIT = 2};

#endif
