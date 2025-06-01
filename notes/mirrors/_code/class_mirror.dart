import 'dart:mirrors';

void main() {
  double n = 4.2;

  // Узнать суперкласс c помощью рефлексии (dart:mirrors имеет статус unstable, и не поддерживается на всех платформах)
  ClassMirror mirrorN = reflectClass(n.runtimeType);
  print(mirrorN.superclass?.reflectedType); // num (супер класс для double)
}
