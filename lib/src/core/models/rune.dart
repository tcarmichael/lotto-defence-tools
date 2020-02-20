import 'package:json_annotation/json_annotation.dart';

import 'stats.dart';

part 'rune.g.dart';

enum RuneOptions {
  Unknown,
  MultiCrit,
  CritDamage,
  Acceleration,
  ArmorDecrease,
  BaseCrit,
  UpgradeChance,
  RaceUpgrades,
  DebuffRemoval,
  TotemAttackDamage,
}

enum AwakeningStage {
  None,
  A,
  B,
  C,
  D,
}

@JsonSerializable(nullable: false)
class Rune {
  Stats baseStats = Stats.empty();
  int enchantLevel = 0;
  AwakeningStage awakeningStage = AwakeningStage.None;
  List<RuneOptions> options = [RuneOptions.Unknown, RuneOptions.Unknown];
  int sp;

  Rune.empty();
  Rune(this.baseStats, this.enchantLevel, this.awakeningStage, this.options, this.sp);
  factory Rune.fromJson(Map<String, dynamic> json) => _$RuneFromJson(json);
  Map<String, dynamic> toJson() => _$RuneToJson(this);

  Stats getStats() {
    var newStats = Stats.clone(baseStats);
    if (newStats.critDamage > 0) {
      newStats.critDamage += enchantLevel;
    }

    // Skill damage is unchanged.
    newStats.attackDamage += enchantLevel +
        (awakeningStage.index >= AwakeningStage.A.index
            ? newStats.attackDamage
            : 0) +
        (hasAttackDamage() ? 15 : 0);
    newStats.attackSpeed += enchantLevel +
        (awakeningStage.index >= AwakeningStage.B.index
            ? newStats.attackSpeed
            : 0);
    newStats.critDamage +=
        (awakeningStage.index >= AwakeningStage.D.index ? 30 : 0) +
            (hasCritDamage() ? 50 : 0);
    newStats.critChance +=
        enchantLevel + (hasCritChance() ? newStats.critChance : 0);

    return newStats;
  }

  int getSp() {
    return sp + (sp > 0 && enchantLevel >= 9 ? 5 : 0);
  }

  bool hasMultiCrit() {
    return options.contains(RuneOptions.MultiCrit);
  }

  bool hasDamageReduction() {
    return options.contains(RuneOptions.ArmorDecrease);
  }

  bool hasUnitAcceleration() {
    return options.contains(RuneOptions.Acceleration);
  }

  bool hasAttackDamage() {
    return options.contains(RuneOptions.TotemAttackDamage);
  }

  bool hasCritDamage() {
    return options.contains(RuneOptions.CritDamage);
  }

  bool hasCritChance() {
    return options.contains(RuneOptions.BaseCrit);
  }
}
