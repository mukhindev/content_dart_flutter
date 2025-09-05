Future<void> main() async {
  // Инициализация переменной произойдёт только в момент первого использования
  late final result = getResult();
  print('Вывод 1');
  // Задержка 2 секунды
  await Future.delayed(Duration(seconds: 2));
  // Использование переменной
  print(result);
}

String getResult() {
  print('Вывод 2');
  return 'result';
}
