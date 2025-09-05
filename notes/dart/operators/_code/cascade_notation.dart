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
