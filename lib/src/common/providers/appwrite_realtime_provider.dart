import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';

final Provider<Realtime> appwriteRealtimeProvider =
    Provider<Realtime>((ProviderRef<Realtime> ref) {
  final Client client = ref.watch(appwriteClientProvider);
  return Realtime(client);
});
