// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..runes = (json['runes'] as List)
        ?.map(
            (e) => e == null ? null : Rune.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..selectedRuneIndex = json['selectedRuneIndex'] as int
    ..title = _$enumDecodeNullable(_$TitleEnumMap, json['title'])
    ..xp = json['xp'] as int
    ..donationSp = json['donationSp'] as int;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'runes': instance.runes,
      'selectedRuneIndex': instance.selectedRuneIndex,
      'title': _$TitleEnumMap[instance.title],
      'xp': instance.xp,
      'donationSp': instance.donationSp,
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

const _$TitleEnumMap = {
  Title.None: 'None',
  Title.Rookie: 'Rookie',
  Title.Beginner: 'Beginner',
  Title.Amateur: 'Amateur',
  Title.Professional: 'Professional',
  Title.Expert: 'Expert',
  Title.Master: 'Master',
  Title.Divine: 'Divine',
  Title.TheOne1: 'TheOne1',
  Title.TheOne2: 'TheOne2',
  Title.TheZero: 'TheZero',
};
