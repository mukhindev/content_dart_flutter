void main() {
  var positions = (10, 50, 0);
  var user = (name: 'Sergey', age: 38);
  var message = ('Привет!', lang: 'ru', '!!!');

  // Деструктуризация всех значений
  var (x, y, z) = positions;
  print('$x $y $z'); // 10 50 0
  var (name: userName, age: useAge) = user;
  print('$userName ${useAge}'); // Sergey 38
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
