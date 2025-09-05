void main() {
  var errorCode = 404;

  var errorCodeMessage = switch (errorCode) {
    200 => 'OK',
    404 => 'Not found',
    _ => 'Unknown error',
  };

  print(errorCode); // Not found
}
