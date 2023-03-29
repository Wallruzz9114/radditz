import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/common/utils/time_ago.dart';
import 'package:radditz/src/constants/constants.dart';
import 'package:radditz/src/models/models.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';
import 'package:radditz/src/modules/post/providers/providers.dart';
import 'package:radditz/src/modules/post/widgets/widgets.dart';

class PostCard extends ConsumerWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppUser? currentUser = ref.watch(getAppUserDetailsProvider).value;

    return currentUser == null
        ? const Loader()
        : ref.watch(appUserDetailsProvider(post.uid)).when(
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
                                margin:
                                    const EdgeInsets.only(top: 10, right: 10),
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
                                    LikeButton(
                                      onTap: (bool liked) async {
                                        ref
                                            .read(
                                                postControllerProvider.notifier)
                                            .likePost(post, currentUser);

                                        return !liked;
                                      },
                                      isLiked:
                                          post.likes.contains(currentUser.uid),
                                      size: 23,
                                      likeBuilder: (bool liked) => liked
                                          ? SvgPicture.asset(
                                              AssetConstants.likeFilledIcon,
                                              color: PalleteConstants.redColor,
                                            )
                                          : SvgPicture.asset(
                                              AssetConstants.likeOutlinedIcon,
                                              color: PalleteConstants.greyColor,
                                            ),
                                      likeCount: post.likes.length,
                                      countBuilder: (
                                        int? likeCount,
                                        bool isLiked,
                                        String text,
                                      ) =>
                                          Text(
                                        text,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isLiked
                                              ? PalleteConstants.redColor
                                              : PalleteConstants.whiteColor,
                                        ),
                                      ),
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
}
