class BankAccount {
  double _balance;
  BankAccount(this._balance);

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('================================================================');
      print('Penambahan Deposit berhasil. Saldo saat ini: \$$_balance');
      print('================================================================');
    } else {
      print('Jumlah yang ingin disetorkan harus lebih besar dari nol.');
      print('================================================================');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Penarikan saldo telah berhasil. Saldo yang tersisa: \$$_balance');
      print('================================================================');
    } else if (amount > _balance) {
      print('Saldo tidak mencukupi. Saldo saat ini: \$$_balance');
      print('================================================================');
    } else {
      print('Jumlah penarikan saldo harus lebih besar dari nol.');
      print('================================================================');

    }
  }

  double checkBalance() {
    return _balance;
  }
}

class SavingsAccount extends BankAccount {
  double _interestRate;

  SavingsAccount(double initialBalance, this._interestRate) : super(initialBalance);

  void applyInterest() {
    double interest = checkBalance() * (_interestRate / 100);
    deposit(interest);
    print('Bunga diterapkan dengan tingkat $_interestRate%. Saldo terkini: \$${checkBalance()}');
    print('================================================================');
  }
}

