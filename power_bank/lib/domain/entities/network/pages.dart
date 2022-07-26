import 'package:json_annotation/json_annotation.dart';

part 'pages.g.dart';

@JsonSerializable()
class Pages {
  Pages({
    required this.privacyPolicy,
    required this.termsOfUse,
    this.aboutUs,
    this.aboutCooperation,
  });
  final String privacyPolicy;
  final String termsOfUse;
  final String? aboutUs;
  final String? aboutCooperation;

  factory Pages.fromJson(Map<String, dynamic> json) => _$PagesFromJson(json);

  Map<String, dynamic> toJson() => _$PagesToJson(this);
}
