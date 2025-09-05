---
date: 2025-05-17 10:00 +2
title: Ввод (stdin)
description: Стандартный ввод в Dart.
tags:
    - dart
---

# Ввод (stdin)

```dart _code/stdin.dart
import 'dart:io';

main() {
  String? line = stdin.readLineSync();
  print('Было введено "$line"');
}
```