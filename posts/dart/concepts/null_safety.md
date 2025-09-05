---
date: 2025-03-20 14:00 +2
title: Null безопасность (Null safety)
description: Начиная с версии Dart 2.12 все переменные создаются как необнуляемые (Non-nullable).
tags:
    - dart
---

# Null безопасность (Null safety)

## Non-nullable и Nullable

Начиная с версии Dart 2.12 все переменные создаются как необнуляемые (Non-nullable).
Они не могут принимать `null`.

```dart _code/null_safety.dart:2-8
  // Non-nullable переменная
  int foo;
  // ❌ Ошибка: Необнуляемая локальная переменная 'foo' должна быть назначена перед ее использованием
  print(foo); // Ошибка

  // ❌ Ошибка: Значение типа 'Null' не может быть присвоено переменной типа 'int'
  foo = null; // Ошибка
```

Переменные которые инициализируются с `null` и которым может быть присвоен `null`,
объявляются явно подставлением символа `?` (Nullable).

```dart _code/null_safety.dart:10-13
  // Nullable переменная
  int? bar;
  print(bar); // null
  bar = null;
```

## Null safety и типы

`Object` базовый класс для всех объектов Dart, кроме `null`.  

Если отметить `Object` как _Nullable_ — `Object?`, можно считать что теперь по типу он `Object` или `null`, а значит может принимать любой объект, включая `null`.

Все _Non-nullable_ объекты наследуются от `Object`.  
Все _Nullable_ объекты наследуются от `Object?`.

## Терминология `null safety` vs `non-nullable`/`nullable`

`null safety` — концепция языка, `non-nullable`/`nullable` — конкретное свойство для переменных и типов реализующих концепцию.