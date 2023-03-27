import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/modules/app_user/controllers/controllers.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';

final StateNotifierProvider<AppUserController, bool> appUserControllerProvider =
    StateNotifierProvider<AppUserController, bool>(
        (StateNotifierProviderRef<AppUserController, bool> ref) {
  return AppUserController(
    appUserService: ref.watch(appUserProvider),
  );
});
