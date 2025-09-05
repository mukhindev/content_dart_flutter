---
date: 2025-05-17 12:12 +2
title: if case
description: Возможность использовать Pattern Matching в if.
tags:
    - dart
---

# `if case`

Возможность использовать [Pattern Matching](../patterns/pattern_matching.md) в `if`

```dart _code/if_case.dart
main() {
  final point = [0, 100, 50];

  if (point case [int x, int y]) {
    print('Point2d $point');
    return Point2d(x, y);
  } else if (point case [int x, int y, int z]) {
    // Выполнится данный кейс
    print('Point3d $point'); // Point3d [0, 100, 50]
    return Point3d(x, y, z);
  } else {
    throw Exception('Неверный формат');
  }
}

class Point2d {
  Point2d(int x, int y);
}

class Point3d {
  Point3d(int x, int y, int z);
}
```