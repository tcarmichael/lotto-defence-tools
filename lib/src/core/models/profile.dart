import 'package:json_annotation/json_annotation.dart';
import '../constants/environment_constants.dart';
import 'rune.dart';
import 'title.dart';

part 'profile.g.dart';

@JsonSerializable(nullable: false)
class Profile {
  Rune rune = Rune.empty();
  Title title = Title.Rookie;
  int xp = 0;

  Profile.empty();
  Profile(this.rune, this.title, this.xp);
  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  int calcTotalSp() {
    var baseSp = xp + GENERAL_BONUS_SP;
    var runeBonus = (rune.getSp() / 100) * baseSp;

    // From testing, the rune bonus seems to be rounded down from the nearest tenths place.
    var roundedBonus = (runeBonus / 10).floor() * 10;

    return baseSp + roundedBonus;
  }
}
