import 'dart:io';

import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/models/models.dart';

abstract class IPostService {
  Future<Either<Failure, model.Document>> createPost(Post post);
  Future<List<String>> uploadImage(List<File> files);
}
