import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/settings.dart';

part 'get_settings_response.g.dart';

@JsonSerializable()
class GetSettingsResponse {
  GetSettingsResponse({
    required this.appConfig,
  });

  final Settings appConfig;

  factory GetSettingsResponse.fromJson(Map<String, dynamic> json) => _$GetSettingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSettingsResponseToJson(this);
}
