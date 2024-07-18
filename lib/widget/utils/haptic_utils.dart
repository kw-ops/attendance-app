import 'package:flutter/services.dart';

class HapticUtils {
  static void vibrate() {
    HapticFeedback.vibrate();
  }

  static void mediumImpact() {
    HapticFeedback.mediumImpact();
  }

  static void heavyImpact() {
    HapticFeedback.heavyImpact();
  }
}
