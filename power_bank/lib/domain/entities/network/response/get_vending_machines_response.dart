import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/vending_machine.dart';

part 'get_vending_machines_response.g.dart';

@JsonSerializable()
class GetVendingMachinesResponse {
  GetVendingMachinesResponse({
    required this.vendingMachines,
  });

  List<VendingMachine> vendingMachines;

  factory GetVendingMachinesResponse.fromJson(Map<String, dynamic> json) => _$GetVendingMachinesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVendingMachinesResponseToJson(this);
}
