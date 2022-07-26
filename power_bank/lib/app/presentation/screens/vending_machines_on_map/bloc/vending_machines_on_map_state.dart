part of 'vending_machines_on_map_bloc.dart';

@freezed
class VendingMachinesOnMapState extends BaseBlocState with _$VendingMachinesOnMapState {
  factory VendingMachinesOnMapState({
    BlocAction? action,
    @Default(false)
        bool mapLoaded,
    @Default(false)
        bool isLoading,
    @Default([])
        List<VendingMachine> vendingMachines,
    VendingMachine? selectedVendingMachine,
    @Default(const CameraPosition(
      target: LatLng(55.759171, 37.619101),
      zoom: 14,
    ))
        CameraPosition cameraPosition,
    Position? userPosition,
    @Default(0)
        double bottomSheetOffset,
  }) = _VendingMachinesOnMapState;
}

class ShowVendingInfoModal extends BlocAction {
  ShowVendingInfoModal({
    required this.vendingMachine,
  });

  VendingMachine vendingMachine;
}

class ShowRentCompletedMessage extends BlocAction {}
