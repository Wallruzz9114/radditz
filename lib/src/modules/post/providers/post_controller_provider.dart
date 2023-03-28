import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/modules/post/controllers/controllers.dart';
import 'package:radditz/src/modules/post/providers/providers.dart';

final StateNotifierProvider<PostController, bool> postControllerProvider =
    StateNotifierProvider<PostController, bool>(
        (StateNotifierProviderRef<PostController, bool> ref) {
  return PostController(ref: ref, postService: ref.watch(postServiceProvider));
});
