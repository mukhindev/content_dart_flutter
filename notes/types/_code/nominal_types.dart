extension type Ruble(int amount) {
  // Конструктор для создания из копеек
  factory Ruble.fromKopecks(int kopecks) => Ruble(kopecks ~/ 100);

  // Геттер для получения суммы в копейках
  int get kopecks => amount * 100;

  // Операторы для арифметических действий
  Ruble operator +(Ruble other) => Ruble(amount + other.amount);

  Ruble operator -(Ruble other) => Ruble(amount - other.amount);

  String format() => '$amount ₽';
}

extension type Dollar(int amount) {
  // Конструктор для создания из центов
  factory Dollar.fromCents(int cents) => Dollar(cents ~/ 100);

  // Геттер для получения суммы в центах
  int get cents => amount * 100;

  // Операторы для арифметических действий
  Dollar operator +(Dollar other) => Dollar(amount + other.amount);

  Dollar operator -(Dollar other) => Dollar(amount - other.amount);

  String format() => '\$$amount';
}

void main() {
  Ruble rubles = Ruble(1000);
  Dollar dollars = Dollar(100);

  // Сложение рублей
  print(rubles + Ruble(1000));

  void acceptOnlyRubles(Ruble amount) {
    print('Платёж в рублях: ${amount.format()}');
  }

  void acceptOnlyDollars(Dollar amount) {
    print('Платёж в долларах: ${amount.format()}');
  }

  acceptOnlyRubles(rubles); // OK
  acceptOnlyDollars(dollars); // OK

  // При необходимости можно получить значение:
  int rublesAmount = rubles.amount;
  int dollarsAmount = dollars.amount;

  // Типы не взаимозаменяемы, хотя основаны на int:
  //// acceptOnlyRubles(dollars); // ❌ Ошибка!
  //// acceptOnlyDollars(rubles); // ❌ Ошибка!
}
