import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';

final Provider<Storage> appwriteStorageProvider =
    Provider<Storage>((ProviderRef<Storage> ref) {
  final Client client = ref.watch(appwriteClientProvider);
  return Storage(client);
});
