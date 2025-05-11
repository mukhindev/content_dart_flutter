# Extension

Возможность расширить поведение класса не модифицируя его.

В отличии от JavaScript, где подобное делается анти-подходом Monkey Patching,
extension в Dart не модифицирует оригинальный класс.

Расширение происходит только там, где оно объявлено или куда импортировано.

```dart _code/extension.dart
void main() {
  List<int> numbers = [1, 2, 3];
  List<String> letters = ['a', 'b', 'c'];

  // Метод есть на List<int> или List<double>
  print(numbers.sum());

  // ❌ Но его нет для List<String>
  print(letters.sum()); // Ошибка
}

// Расширяем возможности List с типом num
extension ListSumExtension on List<num> {
  num sum() {
    return this.fold(0, (prev, element) => prev + element);
  }
}
```
