import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/constants/constants.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/post/interfaces/intefaces.dart';

class PostService implements IPostService {
  PostService({
    required Databases databases,
    required Storage storage,
  })  : _databases = databases,
        _storage = storage;

  final Databases _databases;
  final Storage _storage;

  @override
  Future<Either<Failure, model.Document>> createPost(Post post) async {
    try {
      final model.Document response = await _databases.createDocument(
        databaseId: AppwriteConstants.databaseId!,
        collectionId: AppwriteConstants.postsCollection!,
        documentId: ID.unique(),
        data: post.toMap(),
      );

      return right(response);
    } on AppwriteException catch (error, stackTrace) {
      return left(
        Failure(error.message ?? 'Unexpected AppwriteException', stackTrace),
      );
    } catch (error, stackTrace) {
      return left(Failure(error.toString(), stackTrace));
    }
  }

  @override
  Future<List<String>> uploadImage(List<File> files) async {
    final List<String> imageLinks = <String>[];

    for (final File file in files) {
      final model.File uploadedImage = await _storage.createFile(
        bucketId: AppwriteConstants.bucketId!,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: file.path),
      );
      imageLinks.add(AppwriteConstants.imageUrl(uploadedImage.$id));
    }

    return imageLinks;
  }
}
