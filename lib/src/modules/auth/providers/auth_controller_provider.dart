import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';
import 'package:radditz/src/modules/auth/controllers/controllers.dart';
import 'package:radditz/src/modules/auth/providers/providers.dart';

final StateNotifierProvider<AuthController, bool> authControllerProvider =
    StateNotifierProvider<AuthController, bool>(
        (StateNotifierProviderRef<AuthController, bool> ref) {
  return AuthController(
    authService: ref.watch(authProvider),
    appUserService: ref.watch(appUserProvider),
  );
});
