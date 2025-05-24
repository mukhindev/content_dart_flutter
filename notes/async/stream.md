# Потоки (Stream)

## asBroadcastStream()

```dart _code/stream.dart
Future<void> main() async {
  final stream = createStream().asBroadcastStream();

  print('Подключился Пользователь A');
  final sub1 = stream.listen((value) {
    print('Пользователь A видит: $value');
  });

  await delay(5);

  print('Подключился Пользователь B');
  final sub2 = stream.listen((value) {
    print('Пользователь B видит: $value');
  });

  await delay(2);

  print('Пользователь A вышел');
  sub1.cancel();

  await delay(2);

  print('Пользователь B вышел');
  sub2.cancel();
}

Stream<String> createStream() async* {
  await delay(2);
  yield 'Привет всем в этом чате!';
  await delay(2);
  yield 'Подскажите, как сложить 2 + 2 в Dart?';
  await delay(2);
  yield 'Ну или хотя бы 1 + 1';
  await delay(2);
  yield 'Долго мне ждать ответа?';
  await delay(2);
  yield 'Все ушли что ли?';
}

Future<void> delay(int seconds) {
  return Future.delayed(Duration(seconds: seconds));
}
```

## Цикл в потоке

Например для создания бесконечного потока

```dart _code/infinity_stream.dart
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
```