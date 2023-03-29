import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/common/common.dart';
import 'package:radditz/src/modules/post/services/services.dart';

final Provider<PostService> postServiceProvider =
    Provider<PostService>((ProviderRef<PostService> ref) {
  return PostService(
      databases: ref.watch(appwriteDatabasesProvider),
      storage: ref.watch(appwriteStorageProvider),
      realtime: ref.watch(appwriteRealtimeProvider));
});
