import 'package:json_annotation/json_annotation.dart';

part 'url_wrapper.g.dart';

@JsonSerializable()
class UrlWrapper {
  final String url;

  UrlWrapper({required this.url});

  factory UrlWrapper.fromJson(Map<String, dynamic> json) =>
      _$UrlWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$UrlWrapperToJson(this);
}
