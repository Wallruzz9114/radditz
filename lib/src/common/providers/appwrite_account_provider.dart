import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';

final Provider<Account> appwriteAccountProvider =
    Provider<Account>((ProviderRef<Account> ref) {
  final Client client = ref.watch(appwriteClientProvider);
  return Account(client);
});
