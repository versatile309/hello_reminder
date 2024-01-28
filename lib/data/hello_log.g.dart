// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hello_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HelloLog _$$_HelloLogFromJson(Map<String, dynamic> json) => _$_HelloLog(
      id: json['id'] as int,
      friendId: json['friendId'] as int,
      timestamp: json['timestamp'] as int,
      action: $enumDecode(_$HelloActionEnumMap, json['action']),
    );

Map<String, dynamic> _$$_HelloLogToJson(_$_HelloLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'friendId': instance.friendId,
      'timestamp': instance.timestamp,
      'action': _$HelloActionEnumMap[instance.action]!,
    };

const _$HelloActionEnumMap = {
  HelloAction.call: 'call',
  HelloAction.message: 'message',
  HelloAction.katalk: 'katalk',
};
