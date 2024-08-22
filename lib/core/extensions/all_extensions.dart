import 'package:example_fish_fortune/core/utils/enum.dart';
import 'package:example_fish_fortune/core/utils/regex.dart';

extension StringExt on String {
  String capitalize() {
    if (isEmpty) return this;

    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool isValidEmail() {
    return Regex.email.hasMatch(this);
  }

  bool isEmptyWithTrim() {
    return trim().isEmpty;
  }
}

extension RarityExtension on Rarity {
  String get title {
    switch (this) {
      case Rarity.mytical:
        return "MYTICAL";
      case Rarity.legend:
        return "LEGEND";
      case Rarity.epic:
        return "EPIC";
      case Rarity.rare:
        return "RARE";
      case Rarity.uncommon:
        return "UNCOMMON";
      case Rarity.common:
        return "COMMON";
    }
  }
}
