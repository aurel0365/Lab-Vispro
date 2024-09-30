import 'ATM.dart';

void Main(){
  ATMsystem myatm =ATMsystem(4000000.00);

  myatm.deposit(100.00);
  myatm.penarikan(200.00);
  print('saldo saat ini: \$$myatm.checkbalance');
}
