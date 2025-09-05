---
date: 2025-05-17 10:00 +2
title: iOS/Swift через Platform Channel
description: Как из Flutter выполнить нативный iOS код на Swift.
tags:
    - dart
    - flutter
    - ios
    - swift
---

# iOS/Swift через Platform Channel

Вызов iOS/Swift кода во Flutter через Platform Channel.

Используем как обычный метод:

```dart
import 'package:flutter/material.dart';
import './math.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Platform Channel Example')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Сложить 3 + 5 в Swift'),
            onPressed: () {
              // Вызов метода
              const result = callNativeAdd(3 + 5);
              print(result); // 8
            },
          ),
        ),
      ),
    );
  }
}

```

Объявить во Flutter:

```dart
import 'package:flutter/services.dart';

// Канал, на котором будут зарегистрированы методы других платформ
const channel = MethodChannel('com.example.math');

Future<void> callNativeAdd(int a, int b) async {
  try {
    //                    Канал    Возвращаемый тип   Зарегистрированный метод
    //                      ↓                  ↓         ↓
    final result = await channel.invokeMethod<int>('addNumbers', {
      'a': a, //                                                 ↑      
      'b': b, //                                        Передача аргументов
    });
  } on PlatformException catch (e) {
    print('Ошибка вызова кода Swift: ${e.message}');
  }
}

```

Объявить в iOS/Swift.
Найти этот файл, он есть во Flutter (если проект включает iOS версию):

```swift
// 
// ios/Runner/AppDelegate.swift
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // См. отсюда
    let controller = window?.rootViewController as! FlutterViewController
    // Используем тот же канал, что в Dart части:
    let channel = FlutterMethodChannel(
      name: "com.example.math", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { call, result in
      // Имя нашего метода
      if call.method == "addNumbers" {
        // Разбор переданных аргументов. Ключи строки и любой тип данных
        guard let args = call.arguments as? [String: Any],
          // Извлекаем аргумент, приводим к нужному типу
          let a = args["a"] as? Int,
          let b = args["b"] as? Int
        else {
          // Ошибка если не удалось извлечь аргументы
          result(
            FlutterError(
              code: "INVALID_ARGS", message: "Missing or invalid arguments", details: nil))
          return
        }
        
        // Действие над аргументами и возврат значения с помощью вызова result()
        result(a + b)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    // До сюда, остальной код уже есть в файле

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

```