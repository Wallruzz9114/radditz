import 'package:flutter/material.dart';
import 'package:radditz/src/constants/constants.dart';

class HashtagText extends StatelessWidget {
  const HashtagText({super.key, required this.text});

  final String text;

  @override
  RichText build(BuildContext context) {
    final List<TextSpan> textSpans = <TextSpan>[];

    text.split(' ').forEach((String value) {
      if (value.startsWith('#')) {
        textSpans.add(
          TextSpan(
            text: '$value ',
            style: const TextStyle(
              color: PalleteConstants.blueColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else if (value.startsWith('www') || value.startsWith('https://')) {
        textSpans.add(
          TextSpan(
            text: '$value ',
            style: const TextStyle(
              color: PalleteConstants.redColor,
              fontSize: 15,
            ),
          ),
        );
      } else {
        textSpans.add(
          TextSpan(
            text: '$value ',
            style: const TextStyle(fontSize: 15),
          ),
        );
      }
    });

    return RichText(text: TextSpan(children: textSpans));
  }
}
