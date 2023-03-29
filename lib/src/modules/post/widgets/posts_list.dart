import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/constants/constants.dart';
import 'package:radditz/src/models/post.dart';
import 'package:radditz/src/modules/post/providers/providers.dart';
import 'package:radditz/src/modules/post/widgets/widgets.dart';

class PostsList extends ConsumerWidget {
  const PostsList({super.key});

  ListView postsList(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) =>
            PostCard(post: posts[index]),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(getPostsProvider).when(
            data: (List<Post> posts) {
              return ref.watch(getLatestPostProvider).when(
                    data: (RealtimeMessage post) {
                      if (post.events.contains(
                          'databases.${AppwriteConstants.databaseId}.collections.${AppwriteConstants.postsCollection}.documents.*.create')) {
                        posts.insert(0, Post.fromMap(post.payload));
                      }

                      return postsList(posts);
                    },
                    error: (Object error, StackTrace stackTrace) => ErrorText(
                      errorMessage: error.toString(),
                    ),
                    loading: () => postsList(posts),
                  );
            },
            error: (Object error, StackTrace stackTrace) => ErrorText(
              errorMessage: error.toString(),
            ),
            loading: () => const Loader(),
          );
}
