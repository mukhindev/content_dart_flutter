# Каскадная нотация (cascade notation)

Каскады (`..`, `?..`) позволяют выполнять последовательность операций над одним и тем же объектом:

```dart _code/cascade_notation.dart
void main() {
  final user = User();

  user
    ..name = 'Sergey'
    ..age = 38
    ..printAge() // 38
    ..addAge()
    ..printAge(); // 39
}

class User {
  late final String name;
  late int age;

  void addAge() {
    this.age += 1;
  }

  void printAge() {
    print(this.age);
  }
}
```

В JavaScript для получения подобного паттерна используют возврат `this` из методов,
что позволяет делать цепочку вызовов (тут кстати тоже ничего не мешает делать также).
Но это только для методов и сами методы должны иметь определённую реализацию.