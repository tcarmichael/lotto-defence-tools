import '../constants/armor_constants.dart';
import '../constants/difficulty_constants.dart';
import '../constants/environment_constants.dart';
import '../constants/rank_constants.dart';
import 'environment.dart';
import 'rank.dart';
import 'stats.dart';

import 'dart:math';

num calcDps(Stats stats, Environment env) {
  // Account for AD, damage inflicted, enemy armor, armor reudction, FD, flower 3.
  var diffSettings = difficultyDatabase[env.difficulty];
  var enemyArmor = getArmor(env.targetRound, env.difficulty);
  var flowerDamageTaken = (env.flowerDamageTaken) ? FLOWER_DAMAGE_TAKEN : 1;

  var ae = (stats.attackDamage / 100) *
      (diffSettings.damageInflicted / 100) *
      (100 / (100 + enemyArmor * (1 - stats.defenseReduction / 100))) *
      flowerDamageTaken;

  // Account for normal crit and multi-crit.
  var c = calcAverageCritDamage(
      stats.critChance, stats.critDamage, stats.multiCrit);

  // Account for multi-hit damage, multi-hit crit, and multi-hit multi-crit.
  var multiHitCritDamage = calcAverageCritDamage(
      stats.multiHitCritical, stats.critDamage, stats.multiCrit);
  var m = (min(1, stats.multiHitChance / 100)) *
      (stats.multiHitDamage / 100) *
      multiHitCritDamage;

  // Account for AS, speed decrease, UA, DT, SXD, RXD.
  // Place stimpack gem here if it is later added.
  var dtModifier = (env.dt) ? DT_SPEED : 1;
  var rankModifier = (env.unitRank == Rank.RXD)
      ? RXD_SPEED
      : (env.unitRank == Rank.SXD) ? SXD_SPEED : 1;
  var flowerModifier = (env.flowerAttackSpeed) ? FLOWER_ATTACK_SPEED : 1;
  var s = (1 + stats.attackSpeed / 100) *
      (1 - diffSettings.speedDecrease / 100) *
      stats.unitAcceleration *
      dtModifier *
      rankModifier *
      flowerModifier;

  return ae * (c + m) * s;
}

num calcAverageCritDamage(num cc, num cd, num mc) {
  var critChance = min(1, (cc / 100));
  var critDamage = (cd / 100);
  var multiCritChance = critChance * min(1, (cc * MULTI_CRIT_CHANCE / 100));
  var multiCritDamage = mc * critDamage * MULTI_CRIT_DAMAGE;

  return 1 + critChance * critDamage + multiCritChance * multiCritDamage;
}
