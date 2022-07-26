import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:power_bank/app/navigation/navigation_type.dart';
import 'package:power_bank/core/bloc/bloc_action.dart';
import 'package:power_bank/core/entities/phone_number.dart';
import 'package:power_bank/domain/entities/network/settings.dart';
import 'package:power_bank/domain/entities/network/user.dart';

part 'navigate_action.freezed.dart';

@freezed
class NavigateAction extends BlocAction with _$NavigateAction {
  factory NavigateAction.navigateBack() = NavigateBack;

  factory NavigateAction.navigateToAuthorization(NavigateType navigateType) = NavigateToAuthorization;

  factory NavigateAction.navigateToStart(NavigateType navigateType) = NavigateToStart;

  factory NavigateAction.navigateToConfirmPhone(
    NavigateType navigateType, {
    required PhoneNumber phone,
  }) = NavigateToConfirmPhone;

  factory NavigateAction.navigateToNavigation(
    NavigateType navigateType, {
    required Settings settings,
    required User user,
  }) = NavigateToNavigation;

  factory NavigateAction.navigateToVendingMachinesOnMap(
    NavigateType navigateType, {
    required bool isDrawerScreen,
  }) = NavigateToVendingMachinesOnMap;
}
