import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/models/models.dart';

abstract class IAppUserService {
  Future<Either<Failure, void>> createAppUser(AppUser appUser);
  Future<Document> getAppUser(String uid);
}
