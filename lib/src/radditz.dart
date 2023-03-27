import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/modules/auth/providers/providers.dart';
import 'package:radditz/src/modules/auth/screens/screens.dart';
import 'package:radditz/src/modules/home/screens/screens.dart';
import 'package:radditz/src/theme/theme.dart';

class Radditz extends ConsumerWidget {
  const Radditz({super.key});

  @override
  MaterialApp build(BuildContext context, WidgetRef ref) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'rADDiTz',
        theme: AppTheme.theme,
        home: ref.watch(getCurrentUserProvider).when(
              data: (Account? user) {
                if (user != null) {
                  return const HomeScreen();
                }

                return const RegisterScreen();
              },
              error: (Object err, StackTrace st) =>
                  ErrorScreen(errorMessage: err as String),
              loading: () => const LoadingScreen(),
            ),
      );
}
