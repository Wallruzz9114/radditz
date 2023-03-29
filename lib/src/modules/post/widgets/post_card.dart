import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/common/utils/time_ago.dart';
import 'package:radditz/src/constants/constants.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';
import 'package:radditz/src/modules/post/widgets/widgets.dart';

class PostCard extends ConsumerWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(appUserDetailsProvider(post.uid)).when(
            data: (AppUser appUser) => Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(appUser.profilePic),
                          radius: 30,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    appUser.username,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Text(
                                  '@${appUser.username} · ${post.postedAt.timeAgo()}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: PalleteConstants.greyColor,
                                  ),
                                ),
                              ],
                            ),
                            HashtagText(text: post.text),
                            if (post.postType == PostType.image)
                              PostImagesCarousel(imageLinks: post.imageLinks),
                            if (post.link.isNotEmpty)
                              Column(
                                children: <Widget>[
                                  const SizedBox(height: 4),
                                  AnyLinkPreview(
                                    link: post.link,
                                    displayDirection:
                                        UIDirection.uiDirectionHorizontal,
                                  ),
                                ],
                              ),
                            Container(
                              margin: const EdgeInsets.only(top: 10, right: 10),
                              child: Row(
                                children: <Widget>[
                                  PostCardIcon(
                                    pathName: AssetConstants.viewsIcon,
                                    text: (post.commentIds.length +
                                            post.reshareCount +
                                            post.likes.length)
                                        .toString(),
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  PostCardIcon(
                                    pathName: AssetConstants.commentIcon,
                                    text: (post.commentIds.length).toString(),
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  PostCardIcon(
                                    pathName: AssetConstants.repostIcon,
                                    text: (post.reshareCount).toString(),
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  PostCardIcon(
                                    pathName: AssetConstants.likeOutlinedIcon,
                                    text: (post.likes.length).toString(),
                                    onTap: () {},
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share_outlined),
                                  ),
                                  const SizedBox(height: 1),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(color: PalleteConstants.greyColor),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Divider(color: PalleteConstants.greyColor),
                ),
              ],
            ),
            error: (Object error, StackTrace stackTrace) => ErrorText(
              errorMessage: error.toString(),
            ),
            loading: () => const Loader(),
          );
}
