import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/modules/auth/providers/providers.dart';
import 'package:radditz/src/modules/auth/services/services.dart';

final Provider<AuthService> authProvider =
    Provider<AuthService>((ProviderRef<AuthService> ref) {
  return AuthService(accountService: ref.watch(appwriteAccountProvider));
});
