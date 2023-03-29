import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:radditz/src/constants/constants.dart';

class PostImagesCarousel extends StatefulWidget {
  const PostImagesCarousel({super.key, required this.imageLinks});

  final List<String> imageLinks;

  @override
  State<PostImagesCarousel> createState() => _PostImagesCarouselState();
}

class _PostImagesCarouselState extends State<PostImagesCarousel> {
  int _currentImageIndex = 0;

  @override
  Stack build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              CarouselSlider(
                items: widget.imageLinks
                    .map(
                      (String link) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        margin: const EdgeInsets.all(10),
                        child: Image.network(link, fit: BoxFit.contain),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (int index, CarouselPageChangedReason reason) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.imageLinks
                    .asMap()
                    .entries
                    .map(
                      (MapEntry<int, String> e) => Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: PalleteConstants.whiteColor.withOpacity(
                              _currentImageIndex == e.key ? 0.9 : 0.4),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      );
}
