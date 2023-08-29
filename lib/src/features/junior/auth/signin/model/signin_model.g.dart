// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninModel _$SigninModelFromJson(Map<String, dynamic> json) => SigninModel(
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SigninModelToJson(SigninModel instance) =>
    <String, dynamic>{
      'documents': instance.documents,
    };
