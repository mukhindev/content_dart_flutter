void main() {
  var list = [1, 2, 3];
  print(list); // [1, 2, 3]

  list.add(4);
  print(list); // [1, 2, 3, 4]

  list[2] = 30;
  print(list); // [1, 2, 30, 4]

  list.last = 42;
  print(list); // [1, 2, 30, 42]

  // Удалить конкретное значение (первое слева)
  list.remove(30);
  print(list); // [1, 2 ,42]

  // Удалить все чётные значения
  list.removeWhere((element) => element.isEven);
  print(list); // [1]

  list.addAll([2, 3, 4, 5, 6, 7, 8, 9]);
  print(list); // [1, 2, 3, 4, 5, 6, 7, 8, 9]

  // По индексу 0 добавить значение 0
  list.insert(0, 0);
  print(list); // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  // Удалить диапазон от (включительно), до (не включая)
  list.removeRange(6, 9);
  print(list); // [0, 1, 2, 3, 4, 5, 9]

  // Очистить список3
  list.clear();
  print(list); // []

  // Сумма элементов черед reduce
  var numbers = [1, 2, 3];
  var sum = numbers.reduce((value, element) => value + element);
  print(sum); // 6

  // Условия при объявлении списков (collection if elements)
  var isActive = false;
  var positionList = ['Первый', 'Второй', if (isActive) 'Третий'];
  print(positionList); // [Первый, Второй]

  // Циклы при объявлении списков (collection for elements)
  var intList = [1, 2, 3];
  var stringList = [for (var i in intList) '#$i'];
  print(stringList); // [#1, #2, #3]
}
