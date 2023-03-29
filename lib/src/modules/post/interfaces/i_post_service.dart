import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/models/models.dart';

abstract class IPostService {
  Future<Either<Failure, model.Document>> createPost(Post post);
  Future<List<String>> uploadImage(List<File> files);
  Future<List<model.Document>> getPosts();
  Stream<RealtimeMessage> getLatestPost();
  Future<Either<Failure, model.Document>> likePost(Post post);
}
