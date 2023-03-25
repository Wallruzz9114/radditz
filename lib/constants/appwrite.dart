import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteConstants {
  static String? databaseId = dotenv.env['DATABASE_ID'];
  static String? projectId = dotenv.env['PROJECT_ID'];
  static String? endpoint = dotenv.env['ENDPOINT'];
}
