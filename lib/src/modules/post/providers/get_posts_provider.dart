import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/post/controllers/controllers.dart';
import 'package:radditz/src/modules/post/providers/providers.dart';

final AutoDisposeFutureProvider<List<Post>> getPostsProvider =
    FutureProvider.autoDispose((FutureProviderRef<List<Post>> ref) {
  final PostController postController =
      ref.watch(postControllerProvider.notifier);
  return postController.getPosts();
});
