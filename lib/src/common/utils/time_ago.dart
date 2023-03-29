extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    final DateTime date2 = DateTime.now();
    final Duration difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}h ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1h ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1 min ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
