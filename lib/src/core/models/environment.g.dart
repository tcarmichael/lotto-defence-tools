// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment()
    ..dt = json['dt'] as bool
    ..flowerAttackDamage = json['flowerAttackDamage'] as bool
    ..flowerAttackSpeed = json['flowerAttackSpeed'] as bool
    ..flowerDamageTaken = json['flowerDamageTaken'] as bool
    ..selfBless = json['selfBless'] as bool
    ..haveArtifact = json['haveArtifact'] as bool
    ..haveSpecOps = json['haveSpecOps'] as bool
    ..haveTerraTron = json['haveTerraTron'] as bool
    ..haveAmon = json['haveAmon'] as bool
    ..haveSpearOfAdun = json['haveSpearOfAdun'] as bool
    ..haveXelnagaKerrigan = json['haveXelnagaKerrigan'] as bool
    ..helpful = json['helpful'] as bool
    ..singleUnitBuff = json['singleUnitBuff'] as bool
    ..useAverageUpgrade = json['useAverageUpgrade'] as bool
    ..duplicateUnitPenalty = json['duplicateUnitPenalty'] as num
    ..limitBreak = json['limitBreak'] as num
    ..targetRound = json['targetRound'] as num
    ..teamAttackDamage = json['teamAttackDamage'] as num
    ..teamAttackSpeed = json['teamAttackSpeed'] as num
    ..teamCritChance = json['teamCritChance'] as num
    ..teamBless = json['teamBless'] as num
    ..torments = json['torments'] as num
    ..unitLevel = json['unitLevel'] as num
    ..difficulty = _$enumDecodeNullable(_$DifficultyEnumMap, json['difficulty'])
    ..unitRank = _$enumDecodeNullable(_$RankEnumMap, json['unitRank']);
}

Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'flowerAttackDamage': instance.flowerAttackDamage,
      'flowerAttackSpeed': instance.flowerAttackSpeed,
      'flowerDamageTaken': instance.flowerDamageTaken,
      'selfBless': instance.selfBless,
      'haveArtifact': instance.haveArtifact,
      'haveSpecOps': instance.haveSpecOps,
      'haveTerraTron': instance.haveTerraTron,
      'haveAmon': instance.haveAmon,
      'haveSpearOfAdun': instance.haveSpearOfAdun,
      'haveXelnagaKerrigan': instance.haveXelnagaKerrigan,
      'helpful': instance.helpful,
      'singleUnitBuff': instance.singleUnitBuff,
      'useAverageUpgrade': instance.useAverageUpgrade,
      'duplicateUnitPenalty': instance.duplicateUnitPenalty,
      'limitBreak': instance.limitBreak,
      'targetRound': instance.targetRound,
      'teamAttackDamage': instance.teamAttackDamage,
      'teamAttackSpeed': instance.teamAttackSpeed,
      'teamCritChance': instance.teamCritChance,
      'teamBless': instance.teamBless,
      'torments': instance.torments,
      'unitLevel': instance.unitLevel,
      'difficulty': _$DifficultyEnumMap[instance.difficulty],
      'unitRank': _$RankEnumMap[instance.unitRank],
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

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DifficultyEnumMap = {
  Difficulty.practice: 'practice',
  Difficulty.veryEasy: 'veryEasy',
  Difficulty.easy: 'easy',
  Difficulty.normal: 'normal',
  Difficulty.hard: 'hard',
  Difficulty.veryHard: 'veryHard',
  Difficulty.hell: 'hell',
  Difficulty.inferno: 'inferno',
  Difficulty.lunatic: 'lunatic',
  Difficulty.holic: 'holic',
  Difficulty.epic: 'epic',
  Difficulty.ultimate: 'ultimate',
  Difficulty.impossible: 'impossible',
  Difficulty.theFinal: 'theFinal',
  Difficulty.hallOfFame: 'hallOfFame',
  Difficulty.towerOfChallenge: 'towerOfChallenge',
};

const _$RankEnumMap = {
  Rank.D: 'D',
  Rank.C: 'C',
  Rank.B: 'B',
  Rank.A: 'A',
  Rank.S: 'S',
  Rank.SS: 'SS',
  Rank.SSS: 'SSS',
  Rank.X: 'X',
  Rank.XD: 'XD',
  Rank.SXD: 'SXD',
  Rank.RXD: 'RXD',
};
