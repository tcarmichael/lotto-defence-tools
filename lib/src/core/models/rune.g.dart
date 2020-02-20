// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rune.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rune _$RuneFromJson(Map<String, dynamic> json) {
  return Rune(
    Stats.fromJson(json['baseStats'] as Map<String, dynamic>),
    json['enchantLevel'] as int,
    _$enumDecode(_$AwakeningStageEnumMap, json['awakeningStage']),
    (json['options'] as List)
        .map((e) => _$enumDecode(_$RuneOptionsEnumMap, e))
        .toList(),
    json['sp'] as int,
  );
}

Map<String, dynamic> _$RuneToJson(Rune instance) => <String, dynamic>{
      'baseStats': instance.baseStats,
      'enchantLevel': instance.enchantLevel,
      'awakeningStage': _$AwakeningStageEnumMap[instance.awakeningStage],
      'options': instance.options.map((e) => _$RuneOptionsEnumMap[e]).toList(),
      'sp': instance.sp,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$AwakeningStageEnumMap = {
  AwakeningStage.None: 'None',
  AwakeningStage.A: 'A',
  AwakeningStage.B: 'B',
  AwakeningStage.C: 'C',
  AwakeningStage.D: 'D',
};

const _$RuneOptionsEnumMap = {
  RuneOptions.Unknown: 'Unknown',
  RuneOptions.MultiCrit: 'MultiCrit',
  RuneOptions.CritDamage: 'CritDamage',
  RuneOptions.Acceleration: 'Acceleration',
  RuneOptions.ArmorDecrease: 'ArmorDecrease',
  RuneOptions.BaseCrit: 'BaseCrit',
  RuneOptions.UpgradeChance: 'UpgradeChance',
  RuneOptions.RaceUpgrades: 'RaceUpgrades',
  RuneOptions.DebuffRemoval: 'DebuffRemoval',
  RuneOptions.TotemAttackDamage: 'TotemAttackDamage',
};
