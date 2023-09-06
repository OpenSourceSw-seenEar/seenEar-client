import 'package:json_annotation/json_annotation.dart';
import 'package:seenear/core/base/model/base_model.dart';

part 'select_gender_model.g.dart';

@JsonSerializable()
class SelectGenderModel extends BaseModel {
  final String worryCategory;

  SelectGenderModel({required this.worryCategory});

  @override
  Map<String, dynamic> toJson() => _$SelectGenderModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$SelectGenderModelFromJson(json);
  }
}
