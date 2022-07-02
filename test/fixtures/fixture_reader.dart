import 'dart:io';

String fixture({String? path = '', required String filename}) {
  if (path == null) {
    throw ArgumentError('path cannot be null');
  } else if (path.isNotEmpty) {
    path = '${path.replaceAll(r'/$', '')}/';
  }

  return File('test/fixtures/$path$filename').readAsStringSync();
}
