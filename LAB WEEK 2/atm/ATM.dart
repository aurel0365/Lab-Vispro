class ATMsystem {
  double _balance;
  ATMsystem(this._balance);

 void deposit(double amount) {
    if (amount <= 0) {
      print('================================================================');
      print('Total Deposit gagal. Masukkan nilai positif');
      print('================================================================');
    }
       _balance += amount;
      print('Deposit berhasil. Total Saldo terbaru : \$$_balance');
      print('================================================================');
    }

    void penarikan (double amount) {
      if (amount <= 0) {
      print('================================================================');
      print('Total Deposit gagal. Masukkan nilai positif');
      print('================================================================');
    } if (amount > _balance) {
      print('Saldo tidak mencukupi. saldo saat ini \$$_balance');
      print('================================================================');
    }else{
      _balance -=amount;
      print('Penarikan saldo berhasil. saldo saat ini : \$$_balance');
    }
  }

  double checkbalance(){
    return _balance;
  }
}

