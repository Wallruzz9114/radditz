import 'package:flutter/material.dart';
import 'package:radditz/src/common/common.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Scaffold build(BuildContext context) => const Scaffold(
        body: Loader(),
      );
}
