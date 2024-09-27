void main() {
  int jumlahmesincuci = 3;
  double penggunaanmesincuci = 2.0;
  double waktumencuci = 1.5;
  int jmlahpenghuni = 5;

  List<double> remainingTime = List.filled(jumlahmesincuci, penggunaanmesincuci);

  int residentsWhoCanWash = countResidents(jmlahpenghuni, remainingTime, waktumencuci);

  print('Jumlah penghuni yang dapat mencuci pada hari yang sama yaitu: $residentsWhoCanWash');
}

int countResidents(int residents, List<double> remainingTime, double timeNeeded) {
  return residents == 0
      ? 0
      : updateMachine(remainingTime, findMaxIndex(remainingTime), timeNeeded) +
          countResidents(residents - 1, remainingTime, timeNeeded);
}

int findMaxIndex(List<double> remainingTime, [int index = 0, int maxIndex = 0]) {
  return index == remainingTime.length
      ? maxIndex
      : findMaxIndex(remainingTime, index + 1, remainingTime[index] > remainingTime[maxIndex] ? index : maxIndex);
}

int updateMachine(List<double> remainingTime, int index, double timeNeeded) {
  remainingTime[index] = remainingTime[index] >= timeNeeded
      ? remainingTime[index] - timeNeeded
      : remainingTime[index];
  return remainingTime[index] == remainingTime[index] - timeNeeded ? 1 : 0;
}

 
   


   