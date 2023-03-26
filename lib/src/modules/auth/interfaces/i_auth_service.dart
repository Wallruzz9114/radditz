import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';

abstract class IAuthService {
  Future<Either<Failure, Account>> register({
    required String email,
    required String password,
  });

  Future<Either<Failure, Session>> login({
    required String email,
    required String password,
  });

  Future<Account?> getCurrentUser();
}
