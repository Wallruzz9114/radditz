import 'package:flutter/material.dart';
import 'package:radditz/src/common/common.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Scaffold build(BuildContext context) => Scaffold(
        body: ErrorText(errorMessage: errorMessage),
      );
}
