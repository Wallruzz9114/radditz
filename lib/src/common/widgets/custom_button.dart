import 'package:flutter/material.dart';
import 'package:radditz/src/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor = PalleteConstants.whiteColor,
    this.textColor = PalleteConstants.backgroundColor,
  });

  final VoidCallback onTap;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  InkWell build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Chip(
          label: Text(
            label,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
          backgroundColor: backgroundColor,
          labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        ),
      );
}
