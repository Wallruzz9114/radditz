import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/app_user/services/services.dart';

class AppUserController extends StateNotifier<bool> {
  AppUserController({required AppUserService appUserService})
      : _appUserService = appUserService,
        super(false);

  final AppUserService _appUserService;

  Future<AppUser> getAppUser(String uid) async {
    final Document document = await _appUserService.getAppUser(uid);
    final AppUser appUser = AppUser.fromMap(document.data);
    return appUser;
  }
}
