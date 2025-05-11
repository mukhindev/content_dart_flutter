void main() {
  // answer может быть чем угодно
  dynamic answer = 42;
  answer = 'text';
  answer = null;
  // Также предполагается, что у него может оказаться любой метод
  answer.getAnswer();
}
