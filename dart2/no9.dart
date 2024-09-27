void main() {
  List<int> weights = [3, 2, 4, 5, 2];
  List<int> values = [50, 30, 40, 70, 20];
  int capacity = 10;

  int maxValue = knapsackRecursive(weights, values, capacity, weights.length);

  print('Nilai tertinggi barang yang bisa dibawa: $maxValue');
}

int knapsackRecursive(List<int> weights, List<int> values, int capacity, int n) {
  if (n == 0 || capacity == 0) return 0;

  int excludeItem = knapsackRecursive(weights, values, capacity, n - 1);

  int includeItem = (weights[n - 1] <= capacity)
      ? values[n - 1] + knapsackRecursive(weights, values, capacity - weights[n - 1], n - 1)
      : excludeItem;

  return max(excludeItem, includeItem);
}

int max(int a, int b) => a > b ? a : b;
