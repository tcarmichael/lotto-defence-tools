// TODO: Fix import statement
import 'package:lotto_defence_tools/core.dart';
import 'package:test/test.dart';

void main() {
  group('Armor tests', () {
    var expectedValues = {
      159: 0,
      160: 4,
      161: 8,
      179: 80,
      180: 88,
      181: 96,
      199: 240,
      200: 252,
      201: 264,
      219: 480,
      220: 495,
      221: 510,
      239: 780,
      240: 803,
      241: 826,
      259: 1240,
      260: 1270,
      261: 1300,
      300: 2470,
    };

    expectedValues.forEach((input, expected) {
      test('Standard armor($input) -> $expected', () {
        expect(getArmor(input, Difficulty.practice), expected);
      });
    });

    var tocExpectedValues = {
      1: 0,
      9: 8,
      10: 10,
      11: 12,
      19: 28,
      20: 33,
      21: 38,
      29: 78,
      30: 93,
      31: 108,
      39: 228,
      40: 278,
      41: 328,
      49: 728,
      50: 808,
      51: 888,
      59: 1528,
      60: 1628,
      61: 1728,
      70: 2628,
    };

    tocExpectedValues.forEach((input, expected) {
      test('ToC armor($input) -> $expected', () {
        expect(getArmor(input, Difficulty.towerOfChallenge), expected);
      });
    });
  });
}