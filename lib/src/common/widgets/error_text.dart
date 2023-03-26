import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Center build(BuildContext context) => Center(
        child: Text(errorMessage),
      );
}
