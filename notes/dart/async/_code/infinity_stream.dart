void main() {
  final sub = counterStream().listen((value) {
    print('Получено значение: $value');
  });
}

Stream<int> counterStream() async* {
  int i = 0;
  while (true) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i++;
  }
}
