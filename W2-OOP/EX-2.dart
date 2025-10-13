class BankAccount {
    //TODO
    final int _accountId;
    final String _accountOwner;
    double _balance;

    BankAccount(this._accountId, this._accountOwner) : _balance = 0;

   //get the balance
   double get balance => _balance;
   String get accountOwner => _accountOwner;
   int get accountId => _accountId;

  //witdraw the balance 
  void withdraw(double amount) {
    if(amount > _balance) throw ('Insufficient balance for withdrawal!');
    if(amount <= 0) throw ('The  amount must be positive.');
    _balance -= amount;
  }

  //credit the amount
  void credit(double amount) {
    if(amount <= 0) throw ('The  amount must be positive.');
    _balance += amount;
  }

}

class Bank {
    // TODO
    final String bankName;
    final List<BankAccount> _bankAccounts = [];

    Bank(this.bankName);

    //method for create new account
    BankAccount createAccount(BankAccount newAccouont) {
      if(_isValidId(newAccouont._accountId)){
        _bankAccounts.add(newAccouont);
        return newAccouont;
      }else{
        throw ('Account with ID ${newAccouont._accountId} already exists');
      }
    }

    //method to check if Id exist
    bool _isValidId(int id) {
      for(var account in _bankAccounts){
        if(account._accountId == id) return false;
      }
      return true;
    }

}
 
void main() {
  Bank myBank = Bank('CADT');
  BankAccount ronanAccount = BankAccount(100, 'Ronan');

  //try to create new account
  try{
    myBank.createAccount(ronanAccount);
   // myBank.createAccount(ronanAccount2);
  } catch(e){
    print('Error: $e');
  }
  
  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
   print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    BankAccount HonglyAccount = BankAccount(100, 'Honlgy');
    myBank.createAccount(HonglyAccount); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
