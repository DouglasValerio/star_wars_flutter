import 'dart:io';

String fixture(String fileName) {
  Directory current = Directory.current;
  return File('${current.path}/test/fixtures/$fileName').readAsStringSync();
}
