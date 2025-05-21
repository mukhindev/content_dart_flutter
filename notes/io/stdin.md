# Ввод (stdin)

```dart _code/stdin.dart
import 'dart:io';

main() {
  String? line = stdin.readLineSync();
  print('Было введено "$line"');
}
```