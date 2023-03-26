import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static MaterialPageRoute<HomeScreen> route() => MaterialPageRoute<HomeScreen>(
        builder: (BuildContext context) => const HomeScreen(),
      );

  @override
  Scaffold build(BuildContext context, WidgetRef ref) => const Scaffold();
}
