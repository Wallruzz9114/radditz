import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/modules/auth/providers/appwrite_client_provider.dart';

final Provider<Account> appwriteAccountProvider =
    Provider<Account>((ProviderRef<Account> ref) {
  final Client client = ref.watch(appwriteClientProvider);
  return Account(client);
});
