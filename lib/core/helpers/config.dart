import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get uri => dotenv.env.containsKey('URI')
      ? dotenv.env['URI']!
      : 'uri não definida no .end';
}
