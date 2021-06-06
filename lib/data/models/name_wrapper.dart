import 'package:json_annotation/json_annotation.dart';

part 'name_wrapper.g.dart';

@JsonSerializable()
class NameWrapper {
  final String name;

  NameWrapper({required this.name});

  factory NameWrapper.fromJson(Map<String, dynamic> json) =>
      _$NameWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$NameWrapperToJson(this);
}
