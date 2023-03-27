import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/app_user/controllers/app_user_controller.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';

final FutureProviderFamily<AppUser, String> appUserDetailsProvider =
    FutureProvider.family((FutureProviderRef<AppUser> ref, String uid) {
  final AppUserController appUserController =
      ref.watch(appUserControllerProvider.notifier);
  return appUserController.getAppUser(uid);
});
