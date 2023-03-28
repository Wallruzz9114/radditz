import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/common/utils/pick_image.dart';
import 'package:radditz/src/constants/constants.dart';
import 'package:radditz/src/models/app_user.dart';
import 'package:radditz/src/modules/app_user/providers/providers.dart';
import 'package:radditz/src/modules/post/providers/providers.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  static MaterialPageRoute<CreatePostScreen> route() =>
      MaterialPageRoute<CreatePostScreen>(
        builder: (BuildContext context) => const CreatePostScreen(),
      );

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  final TextEditingController postTextController = TextEditingController();
  List<File> images = <File>[];

  Future<void> openGallery() async {
    images = await pickImages();
    setState(() {});
  }

  void createPost() {
    ref.read(postControllerProvider.notifier).createPost(
          images: images,
          text: postTextController.text,
          repliedTo: '',
          repliedToUserId: '',
          context: context,
        );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    postTextController.dispose();
  }

  @override
  Scaffold build(BuildContext context) {
    final AppUser? appUser = ref.watch(getAppUserDetailsProvider).value;
    final bool isLoading = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, size: 30),
        ),
        actions: <Widget>[
          CustomButton(
            onTap: createPost,
            label: 'Post',
            backgroundColor: PalleteConstants.blueColor,
            textColor: PalleteConstants.whiteColor,
          ),
        ],
      ),
      body: isLoading || appUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(appUser.profilePic),
                          radius: 30,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            controller: postTextController,
                            style: const TextStyle(fontSize: 22),
                            decoration: const InputDecoration(
                              hintText: "What's on your mind?",
                              hintStyle: TextStyle(
                                color: PalleteConstants.greyColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                    if (images.isNotEmpty)
                      CarouselSlider(
                        items: images
                            .map(
                              (File file) => Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Image.file(file),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          height: 400,
                          enableInfiniteScroll: false,
                        ),
                      )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PalleteConstants.greyColor),
          ),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20).copyWith(right: 10),
              child: GestureDetector(
                onTap: openGallery,
                child: SvgPicture.asset(AssetConstants.galleryIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20).copyWith(left: 0, right: 10),
              child: SvgPicture.asset(AssetConstants.gifIcon),
            ),
            Padding(
              padding: const EdgeInsets.all(20).copyWith(left: 0, right: 0),
              child: SvgPicture.asset(AssetConstants.emojiIcon),
            ),
          ],
        ),
      ),
    );
  }
}
