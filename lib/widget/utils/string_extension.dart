extension StringExtension on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get splitAndJoinEachUpperCase {
    return split(
      RegExp('(?=[A-Z])'),
    ).join(' ');
  }

  String get replaceWithAsterics {
    return replaceAll(RegExp('.(?=.{4})'), '*');
  }

  String get removeWhiteSpace {
    return trim();
  }

  String get removeSpecialCharacters {
    return replaceAll(RegExp('[^A-Za-z0-9]'), '');
  }
}
