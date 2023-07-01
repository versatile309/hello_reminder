// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hello_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HelloLog _$$_HelloLogFromJson(Map<String, dynamic> json) => _$_HelloLog(
      id: json['id'] as String,
      timdstamp: json['timdstamp'] as String,
      helloAction: $enumDecode(_$HelloActionEnumMap, json['helloAction']),
    );

Map<String, dynamic> _$$_HelloLogToJson(_$_HelloLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timdstamp': instance.timdstamp,
      'helloAction': _$HelloActionEnumMap[instance.helloAction]!,
    };

const _$HelloActionEnumMap = {
  HelloAction.call: 'call',
  HelloAction.message: 'message',
  HelloAction.katalk: 'katalk',
};
