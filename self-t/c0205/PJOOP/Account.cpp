//Account.cpp

#include "BankingCommonDecl.h"
#include "Account.h"

Account::Account(int ID, int money, char* name)
	: accID(ID), balance(money)
{
	cusName = new char[strlen(name)+1];
	strcpy(cusName, name);
}
Account::Account(const Account& ref)
	: accID(ref.accID), balance(ref.balance)
{
	cusName = new char[strlen(ref.cusName)+1];
	strcpy(cusName, ref.cusName);
}

int Account::GetAccId() const { return accID; }
void Account::Deposit(int money)
{
	balance+= money;
}
