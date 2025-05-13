void main() {
  var positions = (10, 50, 0);
  var user = (name: 'Sergey', age: 38);
  var message = ('Привет!', lang: 'ru', '!!!');

  // Деструктуризация всех значений
  var (x, y, z) = positions;
  print('$x $y $z'); // 10 50 0
  // Именованные значения мы можем извлечь под другим именем.
  // Если извлечь нужно под тем же именем, можно сократить запись (см `:age`)
  var (name: userName, :age) = user;
  print('$userName ${age}'); // Sergey 38
  var (text, third, lang: language) = message;
  // Обратить внимание, именованные в любом порядке,
  // неименованные в порядке как идут.
  print('$text ${third} ${language}'); // Привет! !!! ru

  // ❌ В Dart нельзя выполнять частичную деструктуризацию записи Record
  //// var (x1, y1) = positions; // Ошибка Pattern matching
  //// var (name: userName) = user; // Ошибка Pattern matching

  // Ненужные значение можно заменить `_` (wildcard) по одному
  var (x2, _, _) = positions;
  var (age: _, name: userName2) = user;
  var (lang: language2, _, _) = message;
}
