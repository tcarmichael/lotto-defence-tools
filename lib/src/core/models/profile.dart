import 'package:json_annotation/json_annotation.dart';
import '../constants/environment_constants.dart';
import 'rune.dart';
import 'title.dart';

part 'profile.g.dart';

const int numRunes = 5;

@JsonSerializable(nullable: true)
class Profile {
  List<Rune> runes = List<Rune>.generate(numRunes, (i) { return Rune.empty(); });
  int selectedRuneIndex = 0;
  Title title = Title.Rookie;
  int xp = 0;
  int donationSp = 0;

  Rune get selectedRune {
    try {
      return runes[selectedRuneIndex];
    } catch (e) {
      return null;
    }
  }

  Profile.empty();
  Profile();
  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  int calcTotalSp() {
    var baseSp = xp + GENERAL_BONUS_SP;
    var runeBonus = (selectedRune.getSp() / 100) * baseSp;

    // From testing, the rune bonus seems to be rounded down from the nearest tenths place.
    var roundedBonus = (runeBonus / 10).floor() * 10;

    return baseSp + roundedBonus + donationSp;
  }
}
