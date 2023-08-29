import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:seenear/core/base/model/base_model.dart';

part 'signin_model.g.dart';

@JsonSerializable()
class SigninModel extends BaseModel<SigninModel> with EquatableMixin {
  final List<String>? documents;

  SigninModel({this.documents});

  @override
  Map<String, dynamic> toJson() {
    return _$SigninModelToJson(this);
  }

  @override
  SigninModel fromJson(Map<String, dynamic> json) {
    return _$SigninModelFromJson(json);
  }

  @override
  List<Object?> get props => [documents];

  SigninModel copyWith({
    List<String>? documents,
  }) {
    return SigninModel(
      documents: documents ?? this.documents,
    );
  }
}
