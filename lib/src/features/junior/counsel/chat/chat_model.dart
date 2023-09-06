import 'package:json_annotation/json_annotation.dart';
import 'package:seenear/core/base/model/base_model.dart';
import 'package:seenear/src/constants/enums/chat_person_enum.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel extends BaseModel {
  final ChatPersonType personType;
  final List<String> message;
  final DateTime time;

  ChatModel({
    required this.personType,
    required this.message,
    required this.time,
  });

  List<Object?> get props => [personType, message, time];

  @override
  ChatModel fromJson(Map<String, dynamic> json) {
    return _$ChatModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ChatModelToJson(this);
  }
}
