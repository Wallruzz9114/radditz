import 'package:appwrite/appwrite.dart';
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/constants/constants.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/app_user/interfaces/interfaces.dart';

class AppUserService implements IAppUserService {
  AppUserService({required Databases databases}) : _databases = databases;

  final Databases _databases;

  @override
  Future<Either<Failure, void>> createAppUser(AppUser appUser) async {
    try {
      await _databases.createDocument(
        databaseId: AppwriteConstants.databaseId!,
        collectionId: AppwriteConstants.usersCollection!,
        documentId: ID.unique(),
        data: appUser.toMap(),
      );

      return right(null);
    } on AppwriteException catch (error, stackTrace) {
      return left(
        Failure(error.message ?? 'Unexpected AppwriteException', stackTrace),
      );
    } catch (error, stackTrace) {
      return left(Failure(error.toString(), stackTrace));
    }
  }
}
