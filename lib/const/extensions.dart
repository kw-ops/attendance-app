extension StringExtensions on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get splitAndJoinEachUpperCase {
    return split(
      RegExp('(?=[A-Z])'),
    ).map((e) => e.capitalize).join(' ');
  }
}
