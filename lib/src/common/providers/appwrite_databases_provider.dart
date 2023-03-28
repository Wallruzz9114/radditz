import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';

final Provider<Databases> appwriteDatabasesProvider =
    Provider<Databases>((ProviderRef<Databases> ref) {
  final Client client = ref.watch(appwriteClientProvider);
  return Databases(client);
});
