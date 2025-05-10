void main() {
  // const означает константу времени компиляции (compile-time constant).
  const list1 = [1, 2, 3];
  const list2 = [1, 2, 3];
  // Два одинаковых объекта по ссылке
  print(identical(list1, list2)); // true

  // Не используем const
  final list3 = [1, 2, 3];
  final list4 = [1, 2, 3];
  // Это 2 разных объекта
  print(identical(list3, list4)); // false

  // Ещё вариант использования const
  final list5 = const [1, 2, 3];
  final list6 = const [1, 2, 3];
  print(identical(list5, list6)); // true
  // Сравнение с первым
  print(identical(list1, list6)); // true
}
