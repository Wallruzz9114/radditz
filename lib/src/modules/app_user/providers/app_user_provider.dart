import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';
import 'package:radditz/src/modules/app_user/services/services.dart';

final Provider<AppUserService> appUserProvider =
    Provider<AppUserService>((ProviderRef<AppUserService> ref) {
  return AppUserService(databases: ref.watch(appwriteDatabasesProvider));
});
