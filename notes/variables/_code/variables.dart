void main() {
  // Объявление переменной через явную аннотацию типа
  int foo = 42;
  // Присвоение нового значения
  foo = 43;
  // ❌ Переменной нельзя присвоить значение другого типа
  // foo = "text";

  // Объявление переменной через ключевое слово var. Тип будет выведен.
  var bar = 42;

  // const означает константу времени компиляции (compile-time constant).
  const list1 = [1, 2, 3];
  const list2 = [1, 2, 3];
  // Два одинаковых объекта по ссылке
  print(identical(list1, list2)); // true

  // Ещё вариант использования const
  List<int> list5 = const [1, 2, 3];
  List<int> list6 = const [1, 2, 3];
  print(identical(list5, list6)); // true

  // Не используем const
  final list3 = [1, 2, 3];
  final list4 = [1, 2, 3];
  // Это 2 разных объекта
  print(identical(list3, list4)); // false

  // Инициализация final может быть произведена позже, но обычно почти сразу
  final x;
  // Нельзя обратиться, ещё не инициализирована
  // print(x);
  x = 1;
}
