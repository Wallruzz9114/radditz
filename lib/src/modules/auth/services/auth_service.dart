import 'package:appwrite/appwrite.dart' as service;
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/modules/auth/interfaces/interfaces.dart';

class AuthService implements IAuthService {
  AuthService({
    required service.Account accountService,
  }) : _accountService = accountService;

  final service.Account _accountService;

  @override
  Future<Either<Failure, model.Account>> register({
    required String email,
    required String password,
  }) async {
    try {
      final model.Account account = await _accountService.create(
        userId: service.ID.unique(),
        email: email,
        password: password,
      );

      return right(account);
    } on service.AppwriteException catch (error, stackTrace) {
      return left(
        Failure(error.message ?? 'Unexpected AppwriteException', stackTrace),
      );
    } catch (error, stackTrace) {
      return left(Failure(error.toString(), stackTrace));
    }
  }

  @override
  Future<Either<Failure, model.Session>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model.Session session = await _accountService.createEmailSession(
        email: email,
        password: password,
      );

      return right(session);
    } on service.AppwriteException catch (error, stackTrace) {
      return left(
        Failure(error.message ?? 'Unexpected AppwriteException', stackTrace),
      );
    } catch (error, stackTrace) {
      return left(Failure(error.toString(), stackTrace));
    }
  }

  Future<model.Account?> getCurrentUser() async {
    try {
      return await _accountService.get();
    } on service.AppwriteException {
      return null;
    } catch (_) {
      return null;
    }
  }
}
