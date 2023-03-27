import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/modules/auth/controllers/auth_controller.dart';
import 'package:radditz/src/modules/auth/providers/providers.dart';

final FutureProvider<Account?> getCurrentUserProvider =
    FutureProvider<Account?>((FutureProviderRef<Account?> ref) {
  final AuthController authController =
      ref.watch(authControllerProvider.notifier);
  return authController.getCurrentUser();
});
