import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/constants/assets.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/app_user/services/services.dart';
import 'package:radditz/src/modules/auth/screens/screens.dart';
import 'package:radditz/src/modules/auth/services/services.dart';
import 'package:radditz/src/modules/home/screens/screens.dart';

class AuthController extends StateNotifier<bool> {
  AuthController({
    required AuthService authService,
    required AppUserService appUserService,
  })  : _authService = authService,
        _appUserService = appUserService,
        super(false);

  final AuthService _authService;
  final AppUserService _appUserService;

  Future<void> register({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final Either<Failure, Account> registerResponse =
        await _authService.register(
      email: email,
      password: password,
    );
    state = false;

    registerResponse.fold(
      (Failure f) => showSnackbar(context, f.message),
      (Account a) async {
        final String username = getUsernameFromEmail(email);

        final AppUser newAppUser = AppUser(
          uid: a.$id,
          email: email,
          username: username,
          followers: const <String>[],
          following: const <String>[],
          profilePic: AssetConstants.avatarDefault,
          bannerPic: AssetConstants.bannerDefault,
          bio: '',
          isVerified: false,
        );

        final Either<Failure, void> newAppUserResponse =
            await _appUserService.createAppUser(newAppUser);

        newAppUserResponse.fold(
          (Failure f) => showSnackbar(context, f.message),
          (void _) {
            showSnackbar(context, 'Account has been created! Please log in.');
            Navigator.push(context, LoginScreen.route());
          },
        );
      },
    );
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final Either<Failure, Session> sessionResponse = await _authService.login(
      email: email,
      password: password,
    );
    state = false;

    sessionResponse.fold(
      (Failure f) => showSnackbar(context, f.message),
      (Session s) {
        Navigator.push(context, HomeScreen.route());
      },
    );
  }

  Future<Account?> getCurrentUser() async => _authService.getCurrentUser();
}
