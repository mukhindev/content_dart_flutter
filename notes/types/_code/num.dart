void main() {
  int answer = 42;
  double rating = 4.5;

  // int и double наследуют класс num
  print(answer is num); // true
  print(rating is num); // true

  // Проверить отрицательное ли число?
  print((-0.0001).isNegative); // true
  print((-0).isNegative); // false
  print((1).isNegative); // false

  // Перевод из десятичная (decimal) в другую систему счисления
  print(15.toRadixString(2)); // 1111 (binary, двоичная)
  print(15.toRadixString(8)); // 17 (octal, восьмеричная)
  print(15.toRadixString(16)); // f (hex, шестнадцатеричная)

  // Необходимое кол-во битов для хранения числа
  print(42.bitLength); // 6
  // Проверяем
  print(42.toRadixString(2)); // 101010 (6 битов)

  // Наибольший общий делитель (НОД).
  // НОД двух (или более) чисел — это самое большое число, на которое эти числа делятся без остатка
  print(42.gcd(12)); // 6
}
