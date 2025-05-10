import 'dart:io';

/// Обработка md файлов

/// RegExp кодового блока в md
const CODE_BLOCK_REGEXP = r'```(\w+) (.+?)\n([\s\S]*?)```';

void main() async {
  await findAndProcessMarkdownFiles(Directory.current);
}

/// Поиск и обработка md файлов
Future<void> findAndProcessMarkdownFiles(Directory directory) async {
  await for (var entity in directory.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.md')) {
      print('MD: ${entity.path}');
      await processMarkdownFile(entity);
    }
  }
}

/// Обработка md файла
Future<void> processMarkdownFile(File file) async {
  final content = await file.readAsString();
  final updatedContent = await replaceCodeBlocks(content, file.parent);
  await file.writeAsString(updatedContent);
}

/// Принимает md контент, подменяет в нём кодовые блоки.
/// Если в кодовом блоке сразу за меткой языка есть относительный путь до файла,
/// его содержимое будет прочитано и вставлено в соответствующий кодовый блок.
/// ```md
/// ```dart ./test.dart
/// Это будет заменено содержимым из ./test.dart
/// ```
/// ```
Future<String> replaceCodeBlocks(
  String content,
  Directory parentDirectory,
) async {
  // Находим все кодовые блоки
  final codeBlockPattern = RegExp(CODE_BLOCK_REGEXP);
  final matches = codeBlockPattern.allMatches(content);
  final matchesList = matches.toList();

  // Строковый буфер для сборки обновлённого контента (StringBuffer быстрее String при многократной обработке)
  final updatedContent = StringBuffer();
  // Конц предыдущего совпадения
  var lastMatchEnd = 0;

  // Обрабатываем все кодовые блоки
  for (int i = 0; i < matchesList.length; i++) {
    final match = matchesList[i];
    final isLast = i == matchesList.length - 1;

    // Добавляем текст контента от предыдущего блока (либо начала файла) до текущего кодового блоком
    updatedContent.write(content.substring(lastMatchEnd, match.start));

    final language = match.group(1);
    final codeRelativePath = match.group(2);
    final codeFile = File('${parentDirectory.path}/$codeRelativePath');
    final treeCharacter = isLast ? ' └─' : ' ├─';

    if (await codeFile.exists()) {
      final codeContent = await codeFile.readAsString();
      final codeBlock = '```$language $codeRelativePath\n$codeContent```';
      final hasDiff = content.substring(match.start, match.end) != codeBlock;

      if (hasDiff) {
        print('$treeCharacter \x1B[33m{}: ${codeFile.path} *\x1B[0m');
      } else {
        print('$treeCharacter {}: ${codeFile.path}');
      }

      // Добавляем полученный из файла код в кодовый блок контента
      updatedContent.write(codeBlock);
    } else {
      // Если файл не найден, оставляем оригинальный кодовый блок без изменений
      updatedContent.write(match.group(0));
      print('$treeCharacter \x1B[31m{}: ${codeFile.path} !\x1B[0m');
    }

    // Обновляем позицию последнего конца совпадения
    lastMatchEnd = match.end;
  }

  // Добавляем остаток контента после последнего кодового блока
  updatedContent.write(content.substring(lastMatchEnd));
  return updatedContent.toString();
}
