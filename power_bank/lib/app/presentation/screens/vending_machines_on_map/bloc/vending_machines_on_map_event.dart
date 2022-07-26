part of 'vending_machines_on_map_bloc.dart';

@freezed
class VendingMachinesOnMapEvent with _$VendingMachinesOnMapEvent {
  factory VendingMachinesOnMapEvent.init() = Init;
  factory VendingMachinesOnMapEvent.screenOpened() = ScreenOpened;
  factory VendingMachinesOnMapEvent.onMapCreated(GoogleMapController controller) = OnMapCreated;
  factory VendingMachinesOnMapEvent.onCameraMove(CameraPosition position) = OnCameraMove;
  factory VendingMachinesOnMapEvent.onMapTap(LatLng position) = OnMapTap;
  factory VendingMachinesOnMapEvent.vendingMachineOnMapClicked(VendingMachine machine) = VendingMachineOnMapClicked;
  factory VendingMachinesOnMapEvent.vendingMachineSelectClicked(VendingMachine machine) = VendingMachineSelectClicked;
  factory VendingMachinesOnMapEvent.closeVendingMachineInfoClicked() = CloseVendingMachineInfoClicked;
  factory VendingMachinesOnMapEvent.supportServiceClicked() = SupportServiceClicked;
  factory VendingMachinesOnMapEvent.myLocationClicked() = MyLocationClicked;
  factory VendingMachinesOnMapEvent.backClicked() = BackClicked;
  factory VendingMachinesOnMapEvent.productRentCompleted(ProductRent product) = ProductRentCompleted;
  factory VendingMachinesOnMapEvent.timeToCheckActiveRent() = TimeToCheckActiveRent;
  factory VendingMachinesOnMapEvent.userPositionUpdated(Position position) = UserPositionUpdated;
  factory VendingMachinesOnMapEvent.bottomSheetOffsetChanged(double offset) = BottomSheetOffsetChanged;
  factory VendingMachinesOnMapEvent.takePowerBankClicked() = TakePowerBankClicked;
}
