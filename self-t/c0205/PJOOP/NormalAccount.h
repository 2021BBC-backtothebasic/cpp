/*
 *NormalAccount.h
 */

#ifndef _NORMARACCOUNT_H_
#define _NORMALACCOUNT_H_

#include "Account.h"

class NormalAccount : public Account
{
private:
	int interRate;
public:
	NormalAccount(int ID, int money char* name, int rate)
		: Account(Id, oney, name), interRate(rate){ }
	virtual void Deposit(int money)
	{
		Account::Deposit(money);				//add seedmoney
		Account::Deposit(money*(interRate/100.0));		//add Rate
	}
};

#endif
