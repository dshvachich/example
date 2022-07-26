import 'package:json_annotation/json_annotation.dart';

import '../vending_machine.dart';

part 'vending_machine_response.g.dart';

@JsonSerializable()
class VendingMachineResponse {
  VendingMachineResponse({
    required this.vendingMachine,
  });

  VendingMachine vendingMachine;

  factory VendingMachineResponse.fromJson(Map<String, dynamic> json) => _$VendingMachineResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VendingMachineResponseToJson(this);
}
