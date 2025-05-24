# Debounce на Dart

Реализация debounce на Dart

```dart _code/debounce.dart:1-12
import 'dart:async';

Function createDebounce() {
  Timer? timer;

  return (Function callback, [int milliseconds = 500]) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), () {
      callback();
    });
  };
}
```

```dart _code/debounce.dart:14-25
void main() {
  final debounce = createDebounce();

  void run() {
    debounce(() => print('Hello world!'), 500);
  }

  // Напечатается 1 раз с задержкой 500ms
  run();
  run();
  run(); // Hello world!
}
```