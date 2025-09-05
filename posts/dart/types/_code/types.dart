void main() {
  // Числа
  int x = 42;
  double y = 4.2;
  var hex = 0xDEADBEEF; // 3735928559
  var exponents = 1.42e5; // 142000.0

  // Строки
  String a = 'text';

  // Булевы значения
  bool isActive = true;

  // Записи (Record)
  (int, double) bar = (x, y);

  // Функции (Function)
  int getAnswer() {
    return 42;
  }

  // Списки (List, также известные как массивы)
  List<int> numbers = [1, 2, 3];

  // Множества (Set)
  Set<int> uniqueNumbers = {1, 2, 3};

  // Таблицы (Map)
  Map<int, String> namedNumbers = {1: 'One', 2: 'Two', 3: 'Three'};

  // Руны (Rune)
  var smile = '\u{1F600}';
  // 2 UTF-16 кодовых единиц, так как U+1F600 больше U+FFFF
  print(smile.length); // 2
  print(smile.runes.length); // 1
  print(smile.runes.first); // 128512
  print(128512.toRadixString(16)); // 1f600

  // Cимволы (Symbol)
  Symbol sym = Symbol('foo');

  // null (Null)
  null;
}
