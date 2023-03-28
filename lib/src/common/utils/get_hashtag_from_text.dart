List<String> getHashtagFromText(String text) {
  final List<String> words = text.split(' ');
  final List<String> hashtags = <String>[];

  for (final String word in words) {
    if (word.startsWith('#')) {
      hashtags.add(word);
    }
  }

  return hashtags;
}
