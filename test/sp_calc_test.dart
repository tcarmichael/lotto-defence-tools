import 'package:lotto_defence_tools/core.dart';
import 'package:test/test.dart';

void main() {
  // Real values are pulled from the game.
  group('SP Calculation Tests', () {
    test('SP Setup 1', () {
      var profile = Profile.empty();
      profile.xp = 954420;
      profile.rune.enchantLevel = 10;
      profile.rune.sp = 15;
      expect(profile.calcTotalSp(), 1147700);
    });

    test('SP Setup 2', () {
      var profile = Profile.empty();
      profile.xp = 955649;
      profile.rune.enchantLevel = 10;
      profile.rune.sp = 15;
      expect(profile.calcTotalSp(), 1149169);
    });

    test('SP Setup 3', () {
      var profile = Profile.empty();
      profile.xp = 960915;
      profile.rune.enchantLevel = 10;
      profile.rune.sp = 15;
      expect(profile.calcTotalSp(), 1155495);
    });
  });
}
