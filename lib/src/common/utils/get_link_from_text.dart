String getLinkFromText(String text) {
  final List<String> words = text.split(' ');
  String link = '';

  for (final String word in words) {
    if (word.startsWith('https://') || word.startsWith('www.')) {
      link = word;
    }
  }

  return link;
}
