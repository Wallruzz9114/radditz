import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/modules/post/providers/providers.dart';
import 'package:radditz/src/modules/post/services/post_service.dart';

final AutoDisposeStreamProvider<RealtimeMessage> getLatestPostProvider =
    StreamProvider.autoDispose((StreamProviderRef<RealtimeMessage> ref) {
  final PostService postService = ref.watch(postServiceProvider);
  return postService.getLatestPost();
});
