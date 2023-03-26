import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteConstants {
  static String? databaseId = dotenv.env['DATABASE_ID'];
  static String? projectId = dotenv.env['PROJECT_ID'];
  static String? endpoint = Platform.isAndroid
      ? dotenv.env['ANDROID_ENDPOINT']
      : dotenv.env['IOS_ENDPOINT'];
  static String? usersCollection = dotenv.env['USERS_COLLECTION'];
}
