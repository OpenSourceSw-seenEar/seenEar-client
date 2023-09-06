// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailCardModel _$DetailCardModelFromJson(Map<String, dynamic> json) =>
    DetailCardModel(
      reciever: json['reciever'] as String,
      text: json['text'] as String,
      writer: json['writer'] as String,
    );

Map<String, dynamic> _$DetailCardModelToJson(DetailCardModel instance) =>
    <String, dynamic>{
      'reciever': instance.reciever,
      'text': instance.text,
      'writer': instance.writer,
    };
