import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/models/app_user.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';
import 'package:radditz/src/modules/auth/providers/providers.dart';

final FutureProvider<AppUser?> getAppUserDetailsProvider =
    FutureProvider<AppUser?>((FutureProviderRef<AppUser?> ref) {
  final String currentUserId = ref.watch(getCurrentUserProvider).value!.$id;
  final AsyncValue<AppUser> appUserDetails =
      ref.watch(appUserDetailsProvider(currentUserId));
  return appUserDetails.value;
});
