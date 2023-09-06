// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      personType: $enumDecode(_$ChatPersonTypeEnumMap, json['personType']),
      message:
          (json['message'] as List<dynamic>).map((e) => e as String).toList(),
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'personType': _$ChatPersonTypeEnumMap[instance.personType]!,
      'message': instance.message,
      'time': instance.time.toIso8601String(),
    };

const _$ChatPersonTypeEnumMap = {
  ChatPersonType.senior: 'senior',
  ChatPersonType.junior: 'junior',
};
