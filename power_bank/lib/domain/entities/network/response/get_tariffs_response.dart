import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/tariff.dart';

part 'get_tariffs_response.g.dart';

@JsonSerializable()
class GetTariffsResponse {
  GetTariffsResponse({
    required this.tariffs,
  });

  final List<Tariff> tariffs;

  factory GetTariffsResponse.fromJson(Map<String, dynamic> json) => _$GetTariffsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTariffsResponseToJson(this);
}
