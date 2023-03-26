import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Center build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
