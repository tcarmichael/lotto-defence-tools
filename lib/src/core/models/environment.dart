import 'difficulty.dart';
import 'rank.dart';
import 'title.dart';

import 'dart:math';

class Environment {
  Difficulty difficulty = Difficulty.practice;
  bool dt = false;
  bool flowerAttackDamage = false;
  bool flowerAttackSpeed = false;
  bool flowerDamageTaken = false;
  bool selfBless = false;
  bool haveArtifact = false;
  bool haveSpecOps = false;
  bool haveTerraTron = false;
  bool haveAmon = false;
  bool haveSpearOfAdun = false;
  bool haveXelnagaKerrigan = false;
  bool helpful = false;
  bool singleUnitBuff = false;
  num duplicateUnitPenalty = 0;
  num limitBreak = 0;
  num targetRound = 0;
  num teamAttackDamage = 0;
  num teamAttackSpeed = 0;
  num teamCritChance = 0;
  num teamBless = 0;
  num torments = 0;
  num unitLevel = 0;
  Rank unitRank = Rank.D;
  bool useAverageUpgrade = false;

  num calcAverageUpgrade() {
    var calculatedUpgradeChances = 0;
    var myUpgradeChances = 0;
    var myTitle = Title.Divine;
    var upgradeRevisions = 0;
    var upgradeFailRevisions = 0;
    var doubleUpgradeLottos = 0;
    var hasUpgradeMastery = true;

    var successProbability = Environment.fnUpC(
        calculatedUpgradeChances,
        myTitle.index >= Title.TheZero.index,
        upgradeRevisions,
        upgradeFailRevisions);

    var averageUpgrade = 30 *
            successProbability *
            max(calculatedUpgradeChances, myUpgradeChances) *
            ((100 + doubleUpgradeLottos) / 100) +
        (hasUpgradeMastery
            ? calculatedUpgradeChances * (1 - successProbability) * 10 / 2
            : 0);
    return averageUpgrade;
  }

  static num calcBaseUp(bool zero, num upRev) {
    var upP = 100;

    if (zero) {
      upP += 20;
    }

    // Gem sharing
    upP += 5;

    upP += upRev * 2;

    return upP;
  }

  static num fnUpC(num tries, bool zero, num upRev, num upFRev) {
    var upP = Environment.calcBaseUp(zero, upRev);

    // Fail increase
    var fI = 4 + 2 * upFRev;

    // Calculate the streak chances.
    var streakChance = <double>[];
    for (var i = 0; i < tries; i++) {
      var x = 1 - 70 / (upP + i * fI);
      streakChance.add(x);
    }

    // Calculate the upgrade odds.
    var upOdds = <double>[];
    for (var i = 0; i < tries; i++) {
      var x;
      if (i == 0) {
        x = 1;
      } else if (i == 1) {
        x = streakChance[i];
      } else {
        for (var j = 0; j < i - 1; j++) {
          num inter = 1;
          for (var f = 0; f < j - 1; f++) {
            inter *= (1 - streakChance[f]);
          }
          x += (inter * streakChance[j] * upOdds[i - 1 - j]);
        }
      }
      upOdds.add(x);
    }

    // Calculate the average.
    var sum = upOdds.reduce((a, b) => a + b);
    var result = sum / tries;
    return result;
  }
}
