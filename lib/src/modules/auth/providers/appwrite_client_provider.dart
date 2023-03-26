import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radditz/src/constants/constants.dart';

final Provider<Client> appwriteClientProvider =
    Provider<Client>((ProviderRef<Client> ref) {
  final Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.endpoint!)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);
});
