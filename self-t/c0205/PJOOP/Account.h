//Account.h

#ifndef __ACCOUNT_H__
#define __ACCOUNT_H__

class Account
{
	private:
		int accId;
		int balance;
		char* cusName;
	public:
		Account(int ID, int money, char* name);

		int GetAccId() const;
		virtual void Deposit(int money);
		int Withdraw(int money);
		void ShowAccInfo() const;
		~Account();
};

#endif
