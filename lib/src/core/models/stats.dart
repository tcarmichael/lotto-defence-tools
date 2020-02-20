import 'package:json_annotation/json_annotation.dart';

import '../constants/difficulty_constants.dart';
import '../constants/environment_constants.dart';
import '../constants/rank_constants.dart';
import '../constants/rune_constants.dart';
import 'environment.dart';
import 'rune.dart';

part 'stats.g.dart';

enum StatType {
  AttackDamage,
  AttackSpeed,
  CritChance,
  CritDamage,
  MultiCrit,
  SkillDamage,
  ArmorReduction,
  FinalDamage,
  UnitAcceleration,
  MultiHitDamage,
  MultiHitChance,
  MultiHitCritical,
  Etc,
}

@JsonSerializable(nullable: false)
class Stats {
  num attackDamage = 0;
  num attackSpeed = 0;
  num critChance = 0;
  num critDamage = 0;
  num multiCrit = 0;
  num finalDamageIncrease = 0;
  num defenseReduction = 0;
  num unitAcceleration = 0;
  num multiHitDamage = 0; // md
  num multiHitChance = 0; // mp
  num multiHitCritical = 0; // mcp
  num etc = 0;

  Stats.empty();
  Stats(
      this.attackDamage,
      this.attackSpeed,
      this.critChance,
      this.critDamage,
      this.multiCrit,
      this.finalDamageIncrease,
      this.defenseReduction,
      this.unitAcceleration,
      this.multiHitDamage,
      this.multiHitChance,
      this.multiHitCritical,
      this.etc);

  Stats.init(Environment env, Stats sp, Stats ep, Stats gems, Rune rune) {
    calcStats(env, sp, ep, gems, rune);
  }

  Stats.clone(Stats stats)
      : this(
            stats.attackDamage,
            stats.attackSpeed,
            stats.critChance,
            stats.critDamage,
            stats.multiCrit,
            stats.finalDamageIncrease,
            stats.defenseReduction,
            stats.unitAcceleration,
            stats.multiHitDamage,
            stats.multiHitChance,
            stats.multiHitCritical,
            stats.etc);

  num getStat(StatType statType) {
    switch (statType) {
      case StatType.AttackDamage:
        return attackDamage;
      case StatType.AttackSpeed:
        return attackSpeed;
      case StatType.CritChance:
        return critChance;
      case StatType.CritDamage:
        return critDamage;
      case StatType.MultiCrit:
        return multiCrit;
      case StatType.FinalDamage:
        return finalDamageIncrease;
      case StatType.ArmorReduction:
        return defenseReduction;
      case StatType.UnitAcceleration:
        return unitAcceleration;
      case StatType.MultiHitDamage:
        return multiHitDamage;
      case StatType.MultiHitChance:
        return multiHitChance;
      case StatType.MultiHitCritical:
        return multiHitCritical;
      case StatType.Etc:
        return etc;
      default:
        throw UnimplementedError('Unknown stat type');
    }
  }

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);

  void setStat(StatType statType, num value) {
    switch (statType) {
      case StatType.AttackDamage:
        attackDamage = value;
        break;
      case StatType.AttackSpeed:
        attackSpeed = value;
        break;
      case StatType.CritChance:
        critChance = value;
        break;
      case StatType.CritDamage:
        critDamage = value;
        break;
      case StatType.MultiCrit:
        multiCrit = value;
        break;
      case StatType.FinalDamage:
        finalDamageIncrease = value;
        break;
      case StatType.ArmorReduction:
        defenseReduction = value;
        break;
      case StatType.UnitAcceleration:
        unitAcceleration = value;
        break;
      case StatType.MultiHitDamage:
        multiHitDamage = value;
        break;
      case StatType.MultiHitChance:
        multiHitChance = value;
        break;
      case StatType.MultiHitCritical:
        multiHitCritical = value;
        break;
      case StatType.Etc:
        etc = value;
        break;
      default:
        throw UnimplementedError('Unknown stat type');
    }
  }

  void calcStats(Environment env, Stats sp, Stats ep, Stats gems, Rune rune) {
    var runeStats = rune.getStats();

    // Calculate the final damage before calculating attack damage because it is used
    // in that calculation.
    finalDamageIncrease = calcFinalDamage(sp);

    attackDamage = calcAttackDamage(env, sp, ep, gems, runeStats);
    attackSpeed = calcAttackSpeed(env, sp, ep, gems, runeStats);
    critChance = calcCritChance(env, sp, ep, runeStats);
    critDamage = calcCritDamage(env, sp, ep, runeStats);
    multiCrit = calcMultiCrit(sp, ep, rune);
    defenseReduction = calcDefenseReduction(sp, ep, rune);
    unitAcceleration = calcUnitAcceleration(env, sp, rune);
    multiHitDamage = calcMultiHitDamage(sp);
    multiHitChance = calcMultiHitChance(sp);
    multiHitCritical = calcMultiHitCritical(sp);
    etc = calcEtc(sp);
  }

  num calcAttackDamage(
      Environment env, Stats sp, Stats ep, Stats gems, Stats runeStats) {
    // Note: This doesn't implement "general sharing buff", "special sharing buff", or monthly gems.
    // Make sure this.finalDamageIncrease is calculated before this function.
    var preCalc = 100 +
        5 +
        sp.attackDamage +
        runeStats.attackDamage +
        env.teamAttackDamage +
        env.teamBless +
        (env.selfBless ? BLESS_DAMAGE : 0) +
        DAMAGE_LOOKUP[env.unitRank] +
        env.unitLevel * UNIT_LEVEL_ATTACK_DAMAGE_MODIFIER +
        (env.flowerAttackDamage ? (FLOWER_ATTACK_DAMAGE - 1) * 10 : 0) +
        gems.attackDamage +
        (env.haveAmon ? AMON_ATTACK_DAMAGE : 0) +
        (env.singleUnitBuff ? SINGLE_UNIT_ATTACK_DAMAGE : 0) -
        (env.duplicateUnitPenalty * DUPLICATE_UNIT_ATTACK_DAMAGE_PENALTY) +
        (env.useAverageUpgrade ? env.calcAverageUpgrade() : 0) -
        difficultyDatabase[env.difficulty].damageDecrease +
        ep.attackDamage +
        LIMIT_BREAK_DAMAGE_LOOKUP[env.limitBreak];

    var tormentModifier = tormentDatabase[env.torments];

    var ad = (preCalc) *
        (1 + finalDamageIncrease / 100) *
        (1 - tormentModifier / 100);
    return ad;
  }

  num calcAttackSpeed(
      Environment env, Stats sp, Stats ep, Stats gems, Stats runeStats) {
    // Note: This doesn't implement "general sharing buff", "special sharing buff", or monthly gems.
    // My best efforts led me to believe that this isn't implemented in NA.
    var attackSpeed = sp.attackSpeed +
        5 +
        runeStats.attackSpeed +
        env.teamAttackSpeed +
        gems.attackSpeed +
        (env.haveSpecOps ? SPEC_OPS_NOVA_ATTACK_SPEED : 0) +
        ep.attackSpeed;
    return attackSpeed;
  }

  num calcCritChance(Environment env, Stats sp, Stats ep, Stats runeStats) {
    // Note: This doesn't implement "daily code", "general sharing buff",
    // "special sharing buff", or "alpha/solo crit gem".
    var cc = sp.critChance +
        5 +
        runeStats.critChance +
        env.teamCritChance +
        (env.haveArtifact ? ARTIFACT_CRIT_CHANCE : 0) +
        (env.haveTerraTron ? TERRA_TRON_CRIT_CHANCE : 0) +
        (env.haveXelnagaKerrigan ? XELNAGA_KERRIGAN_CRIT_CHANCE : 0) +
        ep.critChance;
    return cc;
  }

  num calcCritDamage(Environment env, Stats sp, Stats ep, Stats runeStats) {
    // Note: This doesn't implement the January gem.
    var tormentModifier = tormentDatabase[env.torments];

    var cd = (1 - tormentModifier / 100) *
        (100 +
            sp.critDamage +
            runeStats.critDamage +
            (env.haveSpearOfAdun ? SPEAR_OF_ADUN_CRIT_DAMAGE : 0) +
            ep.critDamage);
    return cd;
  }

  num calcMultiCrit(Stats sp, Stats ep, Rune rune) {
    // Note: This doesn't implement the Party rune.
    var mc = sp.multiCrit +
        (rune.hasMultiCrit() ? MULTI_CRIT_BONUS : 0) +
        ep.multiCrit;
    return mc;
  }

  num calcFinalDamage(Stats sp) {
    var fd = sp.finalDamageIncrease;
    return fd;
  }

  num calcDefenseReduction(Stats sp, Stats ep, Rune rune) {
    // Note: This doesn't implement awakening stages.
    var dr = sp.defenseReduction +
        (rune.hasDamageReduction() ? DAMAGE_REDUCTION : 0) +
        ep.defenseReduction;
    return dr;
  }

  num calcUnitAcceleration(Environment env, Stats sp, Rune rune) {
    // Note: This doesn't implement monthly gems.
    var ua = sp.unitAcceleration *
        (rune.hasUnitAcceleration() ? UNIT_ACCELERATION : 1) *
        (1 + LIMIT_BREAK_ACCELERATION_LOOKUP[env.limitBreak] / 100);
    return ua;
  }

  num calcMultiHitDamage(Stats sp) {
    var md = sp.multiHitDamage;
    return md;
  }

  num calcMultiHitChance(Stats sp) {
    var mp = sp.multiHitChance;
    return mp;
  }

  num calcMultiHitCritical(Stats sp) {
    var mcp = sp.multiHitCritical;
    return mcp;
  }

  num calcEtc(Stats sp) {
    var etc = sp.etc;
    return etc;
  }
}
