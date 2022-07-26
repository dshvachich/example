// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vending_machines_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVendingMachinesResponse _$GetVendingMachinesResponseFromJson(Map<String, dynamic> json) =>
    GetVendingMachinesResponse(
      vendingMachines: (json['vendingMachines'] as List<dynamic>)
          .map((e) => VendingMachine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetVendingMachinesResponseToJson(GetVendingMachinesResponse instance) => <String, dynamic>{
      'vendingMachines': instance.vendingMachines,
    };
