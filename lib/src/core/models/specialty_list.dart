import '../constants/environment_constants.dart';
import '../constants/difficulty_constants.dart';
import '../constants/specialty_database.dart';
import 'dps.dart';
import 'environment.dart';
import 'profile.dart';
import 'rune.dart';
import 'specialty.dart';
import 'stats.dart';

import 'dart:math';

class SpEfficiencyMap {
  final Specialty sp;
  final num efficiency;
  const SpEfficiencyMap(this.sp, this.efficiency);
}

class SpecialtyList {
  final List<Specialty> _allSpecialties = specialtyDatabase.map((data) => Specialty(data)).toList();
  Iterable<Specialty> get allSpecialties {
    return _allSpecialties;
  }

  void optimize(Profile profile, Environment env, Stats ep, Stats gems) {
    var sp = allSpecialties.fold(
        0, (sum, current) => sum + current.cumulativePointCost());
    var spBank =
        allSpecialties.firstWhere((eachSp) => eachSp.data.name == 'SP Bank');
    var spBankRounds =
        spBank.pointsBought * ((env.targetRound - 1) / 10).floor() * 1000;
    var maxSp = profile.calcTotalSp() + spBankRounds;

    print('Max SP: $maxSp');

    while (sp < maxSp) {
      var spEfficiencies = calcSpEfficiencies(env, ep, gems, profile.selectedRune);

      if (sp == 0) {
        spEfficiencies.forEach((o) => print('Efficency: ${o.efficiency}'));
      }

      // Return if there isn't any SP (shouldn't happen) or if all efficienies are 0.
      if (spEfficiencies.isEmpty || spEfficiencies.every((o) => o.efficiency == 0)) {
        break;
      }

      // Loop over the array of [Specialty, number] and return the object with the highest efficiency.
      var mostEfficient = spEfficiencies
          .where((each) => each.sp.data.requiredTitle.index <= profile.title.index)
          .reduce((max, each) => each.efficiency > max.efficiency ? each : max);

      // Make sure that the next SP won't put us over the cap.
      if (mostEfficient.sp.nextPointCost() <= maxSp - sp) {
        sp += mostEfficient.sp.nextPointCost();
        mostEfficient.sp.pointsBought++;
      } else {
        break;
      }
    }

    var remainingSp = maxSp - sp;
    print('Remaining SP: $remainingSp');
  }

  Stats calcStats() {
    // Calculate the stats from specialties.
    var stats = Stats.empty();

    stats.attackDamage = calcStat(StatType.AttackDamage);
    stats.attackSpeed = calcStat(StatType.AttackSpeed);
    stats.critChance = calcStat(StatType.CritChance);
    stats.critDamage = calcStat(StatType.CritDamage);
    stats.multiCrit = calcStat(StatType.MultiCrit);
    stats.finalDamageIncrease = calcStat(StatType.FinalDamage);
    stats.defenseReduction = calcStat(StatType.ArmorReduction);
    stats.unitAcceleration = calcStat(StatType.UnitAcceleration);
    stats.multiHitDamage = calcStat(StatType.MultiHitDamage);
    stats.multiHitChance = calcStat(StatType.MultiHitChance);
    stats.multiHitCritical = calcStat(StatType.MultiHitCritical);

    return stats;
  }

  Iterable<SpEfficiencyMap> calcSpEfficiencies(
      Environment env, Stats ep, Stats gems, Rune rune) {
    // Calculate stats with the current selected specialties.
    var spStats = calcStats();

    // Calculate total stats and current DPS.
    var totalStats = Stats.init(env, spStats, ep, gems, rune);
    var currentDps = calcDps(totalStats, env);
    var roundedDps = currentDps.toStringAsFixed(6);
    print('Current DPS: $roundedDps');

    // Calculate the next SP efficiency for each SP.
    return allSpecialties.map((sp) =>
        SpEfficiencyMap(sp, calcEfficiency(sp, currentDps, totalStats, env)));
  }

  num calcEfficiency(
      Specialty sp, num oldDps, Stats oldStats, Environment env) {
    if (sp.pointsBought >= sp.data.maxPoints) {
      return 0;
    }

    // TODO: Implement stat cap
    var isOverStatCap = false;
    if (isOverStatCap) {
      return 0;
    }

    // Test incrementing the SP by 1 and calculate the new DPS.
    var newStats = calcStatDifferential(oldStats, sp, env);
    var newDps = calcDps(newStats, env);

    if (newDps == 0) {
      return 0;
    }

    var dpsGrow = newDps / oldDps - 1;
    var nextPointCost = sp.nextPointCost();

    var e = max(dpsGrow / nextPointCost, 0) * 10e7;

    // Put a 3x team multiplier on team buffs.
    if (env.helpful && sp.data.name.contains('Team ')) {
      e *= 3;
    }

    return e;
  }

  num calcStat(StatType statType) {
    num Function(Specialty) statFormula;
    num Function(num sum, Specialty sp) sumFormula;
    num seed;
    switch (statType) {
      // Unit acceleration is calculated differently.
      case StatType.UnitAcceleration:
        statFormula = (Specialty sp) =>
            pow(1 + sp.data.multiplier / 100, sp.pointsBought);
        sumFormula = (num sum, Specialty sp) => sum *= statFormula(sp);
        seed = 1;
        break;

      default:
        statFormula = (Specialty sp) => sp.pointsBought * sp.data.multiplier;
        sumFormula = (num sum, Specialty sp) => sum += statFormula(sp);
        seed = 0;
        break;
    }

    // Add the multi-hit chance base value.
    if (statType == StatType.MultiHitChance) {
      seed = BASE_MULTI_HIT_CHANCE;
    }

    // Filter all specialties based on the StatType and
    // calculate the stat value from the SP spent.
    var stat = allSpecialties
        .where((sp) => sp.data.statTypes.contains(statType))
        .fold(seed, sumFormula);

    return stat;
  }

  Stats calcStatDifferential(Stats baseStats, Specialty sp, Environment env) {
    // If the specialty doesn't modify stats, return the base stats.
    if (sp.data.statTypes.isEmpty) {
      return baseStats;
    }

    // Create a copy of stats because we don't want to alter the base stats.
    var returnStats = Stats.clone(baseStats);

    // Increment each stat of this specialty by one point.
    sp.data.statTypes.forEach((statType) {
      var stat = baseStats.getStat(statType);
      num deltaStat;
      switch (statType) {
        // Unit acceleration is calculated differently.
        case StatType.UnitAcceleration:
          deltaStat = 1 + sp.data.multiplier / 100;
          stat *= deltaStat;
          break;

        // Handle multiplicative stats.
        case StatType.AttackDamage:
          deltaStat = sp.data.multiplier;
          deltaStat *= (1 - tormentDatabase[env.torments] / 100);
          deltaStat *= (1 + baseStats.finalDamageIncrease / 100);
          stat += deltaStat;
          break;

        case StatType.FinalDamage:
          returnStats.attackDamage /= (1 + baseStats.finalDamageIncrease / 100);
          deltaStat = sp.data.multiplier;
          stat += deltaStat;
          returnStats.attackDamage *= (1 + stat / 100);
          break;

        case StatType.CritDamage:
          deltaStat = sp.data.multiplier;
          deltaStat *= (1 - tormentDatabase[env.torments] / 100);
          stat += deltaStat;
          break;

        default:
          deltaStat = sp.data.multiplier;
          stat += deltaStat;
          break;
      }

      returnStats.setStat(statType, stat);
    });

    return returnStats;
  }
}
