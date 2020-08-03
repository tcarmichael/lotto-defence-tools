import 'package:json_annotation/json_annotation.dart';

import 'difficulty.dart';
import 'gem_list.dart';
import 'profile.dart';
import 'rank.dart';
import 'rune.dart';
import 'specialty_list.dart';
import 'title.dart';

import 'dart:math';

part 'environment.g.dart';

@JsonSerializable(nullable: true)
class Environment {
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
  bool useAverageUpgrade = false;
  num duplicateUnitPenalty = 0;
  num limitBreak = 0;
  num targetRound = 0;
  num teamAttackDamage = 0;
  num teamAttackSpeed = 0;
  num teamCritChance = 0;
  num teamBless = 0;
  num torments = 0;
  num unitLevel = 0;
  Difficulty difficulty;
  Rank unitRank;

  Environment();

  factory Environment.fromJson(Map<String, dynamic> json) => _$EnvironmentFromJson(json);
  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);

  // num calcAverageUpgrade(Profile profile, SpecialtyList sp, GemList gems) {
  //   var calculatedUpgradeChances = calcUpgradeChances(profile, sp, gems);
  num calcAverageUpgrade() {
    var calculatedUpgradeChances = 0;
    var upgradeRevisions = 0;
    var upgradeFailRevisions = 0;
    var doubleUpgradeLottos = 0;
    // var hasUpgradeMastery = profile.title.index >= Title.Master.index;
    // var isTheZero = profile.title.index >= Title.TheZero.index;
    var hasUpgradeMastery = true;
    var isTheZero = false;

    var successProbability = Environment.fnUpC(
        calculatedUpgradeChances,
        isTheZero,
        upgradeRevisions,
        upgradeFailRevisions);

    var averageUpgrade = 30 *
            successProbability *
            calculatedUpgradeChances *
            ((100 + doubleUpgradeLottos) / 100) +
        (hasUpgradeMastery
            ? calculatedUpgradeChances * (1 - successProbability) * 10 / 2
            : 0);
    return averageUpgrade;
  }

  int calcUpgradeChances(Profile profile, SpecialtyList sp, GemList gems) {
    // var spUps = ;
    // var runeUps = profile.selectedRune.options.contains(RuneOptions.UpgradeChance) ? x : 0;
    // // Over upgrade and over upgrade+ do not stack.
    // var gemUps = (gems.selectedGems.contains(Gem.OverUpgradePlus)) ? x
    //   : (gems.selectedGems.contains(Gem.OverUpgrade)) ? y
    //   : 0;
    // TODO: Add upgrades from GP.
    // return 10 + spUps + runeUps + gemUps;
    return 10;
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

  static num fnUpC(int tries, bool zero, int upRev, int upFRev) {
    var upP = calcBaseUp(zero, upRev);

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
