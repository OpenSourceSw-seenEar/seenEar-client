import 'package:json_annotation/json_annotation.dart';
import 'package:seenear/core/base/model/base_model.dart';

part 'detail_card_model.g.dart';

@JsonSerializable()
class DetailCardModel extends BaseModel {
  final String reciever;
  final String text;
  final String writer;

  DetailCardModel(
      {required this.reciever, required this.text, required this.writer});

  @override
  Map<String, dynamic> toJson() => _$DetailCardModelToJson(this);

  @override
  DetailCardModel fromJson(Map<String, dynamic> json) {
    return _$DetailCardModelFromJson(json);
  }
}
