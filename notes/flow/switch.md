# Switch

## Switch совместно с операциями сравнения и логическими операциями

```dart _code/switch.dart
main() {
  var value = 42;

  switch (value) {
    // При значениях 10, 20 или 50 выполнится этот кейс
    case 10 || 20 || 50:
      print('Значение $value это 10, 20 или 50');
    // Если значение от 30 до 50 включительно, выполнится этот кейс
    case >= 30 && <= 50:
      print('Значение $value от 30 до 50'); // Значение 42 от 30 до 50
    default:
      print('По-умолчанию. Значение: $value');
  }
}
```

## Switch и Pattern Matching

см. [Pattern Matching](../patterns/pattern_matching.md)

## Switch выражения (Switch Expressions)

Возможность вернуть из switch результат выполнения кейса.
Все кейсы должны возвращать либо результат, либо выкидывать ошибку:

```dart _code/switch_expressions.dart
void main() {
  var errorCode = 404;

  var errorCodeMessage = switch (errorCode) {
    200 => 'OK',
    404 => 'Not found',
    _ => 'Unknown error',
  };

  print(errorCode); // Not found
}
```

