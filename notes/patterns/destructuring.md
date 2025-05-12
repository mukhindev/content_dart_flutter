# Деструктуризация (destructuring)

## Деструктуризация списка

```dart _code/list_destructuring.dart
void main() {
  var positions = <int>[10, 50, 0];

  // Деструктуризация всех значений
  var [x, y, z] = positions;
  print('$x $y $z'); // 10 50 0

  // ❌ В Dart нельзя выполнять неявную частичную деструктуризацию
  var [x1, y1] = positions; // Ошибка Pattern matching

  // Ненужные значение можно заменить `_` (wildcard) по одному
  var [x2, _, _] = positions;
  // Либо через `...` целый диапазон
  var [x3, ...] = positions;
  var [x4, ..., z4] = positions;

  // Если оставшийся диапазон нужен как отдельный список (rest в JavaScript)
  var [x5, ...yz] = positions;
  print(yz); // [50, 0]
}
```

