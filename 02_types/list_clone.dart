void main() {
  var firstList = [
    1,
    [2, 3],
    4,
    5,
  ];

  // Создаёт копию, но не глубокую
  var secondList = List.from(firstList);

  // Изменит элемент под индексом 0 в списке secondList
  secondList[0] = 42;
  // Изменит вложенный массив под индексом 1. И firstList и secondList ссылаются на него
  secondList[1][0] = 100;

  // Вложенный массив изменился в обоих, так как он один и тот же.
  print(firstList); // [1, [100, 3], 4, 5]
  print(secondList); // [42, [100, 3], 4, 5]
}
