import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radditz/src/constants/constants.dart';

class PostCardIcon extends StatelessWidget {
  const PostCardIcon({
    super.key,
    required this.pathName,
    required this.text,
    required this.onTap,
  });

  final String pathName;
  final String text;
  final VoidCallback onTap;

  @override
  GestureDetector build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            SvgPicture.asset(pathName, color: PalleteConstants.greyColor),
            Container(
              margin: const EdgeInsets.all(2),
              child: Text(text, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      );
}
