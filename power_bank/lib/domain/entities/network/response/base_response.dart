import 'package:json_annotation/json_annotation.dart';
import 'package:power_bank/domain/entities/network/response/bank_card_response.dart';
import 'package:power_bank/domain/entities/network/response/bank_cards_response.dart';
import 'package:power_bank/domain/entities/network/response/get_contacts_response.dart';
import 'package:power_bank/domain/entities/network/response/get_settings_response.dart';
import 'package:power_bank/domain/entities/network/response/get_tariffs_response.dart';
import 'package:power_bank/domain/entities/network/response/get_user_response.dart';
import 'package:power_bank/domain/entities/network/response/get_vending_machines_response.dart';
import 'package:power_bank/domain/entities/network/response/login_by_phone_response.dart';

import 'product_rent_response.dart';
import 'vending_machine_response.dart';

part 'base_response.g.dart';

class BaseResponse<M> {
  BaseResponse({
    required this.meta,
    this.data,
  });

  Meta meta;
  M? data;

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    Meta meta = Meta.fromJson(json['meta']);
    if (meta.success) {
      return BaseResponse(
        meta: meta,
        data: json['data'] != null ? _dataFromJson(json['data'], M) : null,
      );
    } else {
      return BaseResponse(meta: meta);
    }
  }

  static I _dataFromJson<I>(json, Type type) {
    if (type == GetSettingsResponse) {
      return GetSettingsResponse.fromJson(json) as I;
    }
    if (type == LoginByPhoneResponse) {
      return LoginByPhoneResponse.fromJson(json) as I;
    }
    if (type == GetVendingMachinesResponse) {
      return GetVendingMachinesResponse.fromJson(json) as I;
    }
    if (type == VendingMachineResponse) {
      return VendingMachineResponse.fromJson(json) as I;
    }
    if (type == ProductRentResponse) {
      return ProductRentResponse.fromJson(json) as I;
    }

    if (type == BankCardsResponse) {
      return BankCardsResponse.fromJson(json) as I;
    }

    if (type == BankCardResponse) {
      return BankCardResponse.fromJson(json) as I;
    }
    if (type == GetContactsResponse) {
      return GetContactsResponse.fromJson(json) as I;
    }
    if (type == GetUserResponse) {
      return GetUserResponse.fromJson(json) as I;
    }

    if (type == GetTariffsResponse) {
      return GetTariffsResponse.fromJson(json) as I;
    }

    // if (<Resident>[] is I) {
    //   return json.map<Resident>((item) => Resident.fromJson(item)).toList() as I;
    // }
    return json as I;
  }
}

@JsonSerializable()
class Meta<M> {
  Meta({
    required this.success,
    required this.error,
  });

  final bool success;
  final String error;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
