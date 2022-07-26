import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/tariff.dart';

part 'vending_machine.g.dart';

@JsonSerializable()
class VendingMachine {
  VendingMachine({
    required this.id,
    required this.maxProductCount,
    required this.freePlacesCount,
    required this.availableProductCount,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.tariff,
  });

  @JsonKey(name: 'vendingMachineId')
  final int id;
  final int maxProductCount;
  final int freePlacesCount;
  final int availableProductCount;
  final String address;
  final double latitude;
  final double longitude;
  final List<Tariff> tariff;

  factory VendingMachine.fromJson(Map<String, dynamic> json) => _$VendingMachineFromJson(json);

  Map<String, dynamic> toJson() => _$VendingMachineToJson(this);
}
