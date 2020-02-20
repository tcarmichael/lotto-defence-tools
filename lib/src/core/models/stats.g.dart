// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return Stats(
    json['attackDamage'] as num,
    json['attackSpeed'] as num,
    json['critChance'] as num,
    json['critDamage'] as num,
    json['multiCrit'] as num,
    json['finalDamageIncrease'] as num,
    json['defenseReduction'] as num,
    json['unitAcceleration'] as num,
    json['multiHitDamage'] as num,
    json['multiHitChance'] as num,
    json['multiHitCritical'] as num,
    json['etc'] as num,
  );
}

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'attackDamage': instance.attackDamage,
      'attackSpeed': instance.attackSpeed,
      'critChance': instance.critChance,
      'critDamage': instance.critDamage,
      'multiCrit': instance.multiCrit,
      'finalDamageIncrease': instance.finalDamageIncrease,
      'defenseReduction': instance.defenseReduction,
      'unitAcceleration': instance.unitAcceleration,
      'multiHitDamage': instance.multiHitDamage,
      'multiHitChance': instance.multiHitChance,
      'multiHitCritical': instance.multiHitCritical,
      'etc': instance.etc,
    };
