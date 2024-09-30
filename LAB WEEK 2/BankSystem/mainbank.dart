import 'BankSystem.dart';
void main() {
  BankAccount myCheckingAccount = BankAccount(1500.0);


  myCheckingAccount.deposit(350);
  myCheckingAccount.withdraw(200);
  print('Saldo yang tersedia: \$${myCheckingAccount.checkBalance()}');
  print('================================================================');

  SavingsAccount mySavingsAccount = SavingsAccount(3000.0, 0.1); 

  mySavingsAccount.applyInterest();
  print('Saldo akhir di akun tabungan: \$${mySavingsAccount.checkBalance()}');
  print('================================================================');
}
