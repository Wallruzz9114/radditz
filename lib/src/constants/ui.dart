import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radditz/src/constants/constants.dart';

class UIConstants {
  static AppBar appBar() => AppBar(
        title: SvgPicture.asset(
          AssetConstants.radditzLogo,
          color: PalleteConstants.blueColor,
          height: 30,
        ),
        centerTitle: true,
      );
}
