import 'dart:io';

import 'package:appwrite/models.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';
import 'package:radditz/src/modules/post/services/services.dart';

class PostController extends StateNotifier<bool> {
  PostController({required Ref ref, required PostService postService})
      : _ref = ref,
        _postService = postService,
        super(false);

  final Ref _ref;
  final PostService _postService;

  void createPost({
    required List<File> images,
    required String text,
    required String repliedTo,
    required String repliedToUserId,
    required BuildContext context,
  }) {
    if (text.isEmpty) {
      showSnackbar(context, 'Please enter a caption');
      return;
    }

    _createPost(
      images: images,
      text: text,
      repliedTo: repliedTo,
      repliedToUserId: repliedToUserId,
      context: context,
    );
  }

  Future<void> _createPost({
    required List<File> images,
    required String text,
    required String repliedTo,
    required String repliedToUserId,
    required BuildContext context,
  }) async {
    state = true;

    final List<String> hashtags = getHashtagFromText(text);
    final String link = getLinkFromText(text);
    final AppUser appUser = _ref.read(getAppUserDetailsProvider).value!;

    final Post post = Post(
      id: '',
      text: text,
      hashtags: hashtags,
      link: link,
      imageLinks: images.isEmpty
          ? const <String>[]
          : await _postService.uploadImage(images),
      uid: appUser.uid,
      postType: images.isEmpty ? PostType.text : PostType.image,
      postedAt: DateTime.now(),
      likes: const <String>[],
      commentIds: const <String>[],
      reshareCount: 0,
      repostedBy: '',
      repliedTo: repliedTo,
    );

    final Either<Failure, model.Document> response =
        await _postService.createPost(post);

    response.fold(
      (Failure f) => showSnackbar(context, f.message),
      (model.Document d) => null,
    );

    state = false;
  }

  Future<List<Post>> getPosts() async {
    final List<model.Document> postsList = await _postService.getPosts();

    return postsList
        .map((model.Document post) => Post.fromMap(post.data))
        .toList();
  }
}
