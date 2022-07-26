import 'dart:typed_data';
import 'dart:ui';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:power_bank/app/navigation/navigate_action.dart';
import 'package:power_bank/app/presentation/modals/message_modal.dart';
import 'package:power_bank/app/presentation/modals/vending_machine_info_modal.dart';
import 'package:power_bank/app/presentation/screens/navigation/bloc/navigation_bloc.dart';
import 'package:power_bank/app/presentation/screens/vending_machines_on_map/bloc/vending_machines_on_map_bloc.dart';
import 'package:power_bank/app/resources/app_styles.dart';
import 'package:power_bank/app/resources/map_style.dart';
import 'package:power_bank/app/widgets/buttons/base_button.dart';
import 'package:power_bank/app/widgets/buttons/menu_button.dart';
import 'package:power_bank/app/widgets/buttons/my_location_button.dart';
import 'package:power_bank/core/bloc/bloc_action.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_listener.dart';
import 'package:power_bank/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:power_bank/core/ui/widgets/dialogs.dart';
import 'package:power_bank/domain/entities/network/vending_machine.dart';
import 'package:power_bank/gen/assets.gen.dart';

class VendingMachinesOnMapScreen extends StatefulWidget {
  @override
  State<VendingMachinesOnMapScreen> createState() => _VendingMachinesOnMapScreenState();
}

class _VendingMachinesOnMapScreenState
    extends BaseBlocStateWidget<VendingMachinesOnMapScreen, VendingMachinesOnMapBloc, VendingMachinesOnMapEvent> {
  GoogleMapController? _mapController;
  static const Duration _animationDuration = const Duration(milliseconds: 350);
  late bool Function(bool stopDefaultButtonEvent, RouteInfo info) _backButtonPressed;
  BitmapDescriptor? powerBankIcon;
  BitmapDescriptor? selectedPowerBankIcon;
  BitmapDescriptor? userIcon;

  @override
  void initState() {
    super.initState();
    _backButtonPressed = (bool stopDefaultButtonEvent, RouteInfo info) {
      if (info.currentRoute(context)?.settings.name?.contains('Navigation') == true) {
        sendEvent(VendingMachinesOnMapEvent.backClicked());
      }
      return true;
    };
    BackButtonInterceptor.add(_backButtonPressed);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(_backButtonPressed);
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppStyles.mainStyle,
        child: Scaffold(
          body: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) => BaseBlocListener<VendingMachinesOnMapBloc, VendingMachinesOnMapState>(
        actionAfterNavigate: (action, data) {
          sendEvent(VendingMachinesOnMapEvent.screenOpened());
        },
        listener: (context, state, action) async {
          if (action is ShowRentCompletedMessage) {
            _showRentCompletedMessage();
          }
          if (action is NavigateAction) {
            _mapController?.dispose();
          }
          if (action is ShowAlertMessage) {
            showAlertMessage(context, action: action);
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: _buildMap(),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: _buildMyLocationButton(),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _buildTakePowerBankButton(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildSelectedVendingMachineInfo(),
            ),
            Positioned(
              top: 8 + mediaQuery.viewPadding.top,
              left: 20,
              child: _buildMenuButton(),
            ),
          ],
        ),
      );

  Widget _buildMap() => BlocBuilder<VendingMachinesOnMapBloc, VendingMachinesOnMapState>(
        buildWhen: (previous, current) =>
            previous.vendingMachines != current.vendingMachines ||
            previous.selectedVendingMachine != current.selectedVendingMachine ||
            previous.userPosition != current.userPosition,
        builder: (context, state) => FutureBuilder<Set<Marker>>(
          future: _generateMarkers(state.vendingMachines, state.selectedVendingMachine, state.userPosition),
          builder: (BuildContext context, AsyncSnapshot<Set<Marker>> snapshot) => GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _mapController?.dispose();
              _mapController = controller;
              _mapController!.setMapStyle(mapStyle);
              sendEvent(VendingMachinesOnMapEvent.onMapCreated(controller));
            },
            onCameraMove: (CameraPosition position) {
              sendEvent(VendingMachinesOnMapEvent.onCameraMove(position));
            },
            onTap: (position) {
              sendEvent(VendingMachinesOnMapEvent.onMapTap(position));
            },
            markers: snapshot.data ?? {},
            mapType: MapType.normal,
            compassEnabled: false,
            mapToolbarEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(3, 18),
            initialCameraPosition: state.cameraPosition,
          ),
        ),
      );

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))?.buffer.asUint8List();
  }

  Future<Set<Marker>> _generateMarkers(
      List<VendingMachine> vendingMachines, VendingMachine? selectedMachine, Position? userPosition) async {
    List<Marker> markers = <Marker>[];
    for (final vendingMachine in vendingMachines) {
      BitmapDescriptor icon;
      if (vendingMachine == selectedMachine) {
        icon = await _getSelectedPowerBankIcon();
      } else {
        icon = await _getPowerBankIcon();
      }
      markers.add(
        Marker(
          markerId: MarkerId(vendingMachine.id.toString()),
          position: LatLng(vendingMachine.latitude, vendingMachine.longitude),
          icon: icon,
          onTap: () {
            sendEvent(VendingMachinesOnMapEvent.vendingMachineOnMapClicked(vendingMachine));
          },
        ),
      );
    }
    if (userPosition != null) {
      markers.add(
        Marker(
          markerId: MarkerId('user'),
          position: LatLng(userPosition.latitude, userPosition.longitude),
          icon: await _getUserIcon(),
        ),
      );
    }

    return markers.toSet();
  }

  Future<BitmapDescriptor> _getPowerBankIcon() async {
    if (powerBankIcon == null) {
      powerBankIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          size: Size(28, 28),
          devicePixelRatio: mediaQuery.devicePixelRatio,
        ),
        Assets.images.marker.assetName,
      );
    }
    return powerBankIcon!;
  }

  Future<BitmapDescriptor> _getSelectedPowerBankIcon() async {
    if (selectedPowerBankIcon == null) {
      selectedPowerBankIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          size: Size(42, 42),
          devicePixelRatio: mediaQuery.devicePixelRatio,
        ),
        Assets.images.oversizedMarker.assetName,
      );
    }
    return selectedPowerBankIcon!;
  }

  Future<BitmapDescriptor> _getUserIcon() async {
    if (userIcon == null) {
      userIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          size: Size(96, 96),
          devicePixelRatio: mediaQuery.devicePixelRatio,
        ),
        Assets.images.userPosition.assetName,
      );
    }
    return userIcon!;
  }

  Widget _buildSelectedVendingMachineInfo() => NotificationListener<DraggableScrollableNotification>(
        onNotification: (DraggableScrollableNotification notification) {
          sendEvent(
            VendingMachinesOnMapEvent.bottomSheetOffsetChanged(mediaQuery.size.height * notification.extent),
          );
          return true;
        },
        child: BlocBuilder<VendingMachinesOnMapBloc, VendingMachinesOnMapState>(
          buildWhen: (previous, current) => previous.selectedVendingMachine != current.selectedVendingMachine,
          builder: (context, state) {
            if (state.selectedVendingMachine != null) {
              sendEvent(
                VendingMachinesOnMapEvent.bottomSheetOffsetChanged(
                  mediaQuery.size.height * _selectedVendingMachineHeightFactor,
                ),
              );
            }

            return AnimatedSwitcher(
              switchInCurve: Curves.easeInOut,
              duration: _animationDuration,
              child: DraggableScrollableSheet(
                key: UniqueKey(),
                snap: true,
                expand: false,
                minChildSize: 0,
                initialChildSize: _selectedVendingMachineHeightFactor,
                maxChildSize: _selectedVendingMachineHeightFactor,
                builder: (context, controller) => state.selectedVendingMachine != null
                    ? VendingMachineInfoModal(
                        vendingMachine: state.selectedVendingMachine!,
                        rentPressed: () {
                          sendEvent(
                              VendingMachinesOnMapEvent.vendingMachineSelectClicked(state.selectedVendingMachine!));
                        },
                        controller: controller,
                        haveActiveRent: false,
                      )
                    : const SizedBox(),
              ),
              transitionBuilder: (child, animation) {
                if (animation.value == 0) {
                  return SizeTransition(axisAlignment: -1, sizeFactor: animation, child: child);
                } else {
                  return const SizedBox();
                }
              },
            );
          },
        ),
      );

  Widget _buildMyLocationButton() => BlocBuilder<VendingMachinesOnMapBloc, VendingMachinesOnMapState>(
        buildWhen: (previous, current) => previous.bottomSheetOffset != current.bottomSheetOffset,
        builder: (context, state) {
          double bottom = 12;
          if (state.bottomSheetOffset == 0 || state.bottomSheetOffset < mediaQuery.viewPadding.bottom) {
            bottom += mediaQuery.viewPadding.bottom;
          } else {
            bottom += state.bottomSheetOffset;
          }

          if (state.bottomSheetOffset == mediaQuery.size.height * _selectedVendingMachineHeightFactor) {
            return AnimatedPadding(
              padding: EdgeInsets.only(bottom: bottom, right: 20),
              duration: _animationDuration,
              child: MyLocationButton(
                onPressed: () {
                  sendEvent(VendingMachinesOnMapEvent.myLocationClicked());
                },
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(bottom: bottom, right: 20),
              child: MyLocationButton(
                onPressed: () {
                  sendEvent(VendingMachinesOnMapEvent.myLocationClicked());
                },
              ),
            );
          }
        },
      );

  Widget _buildMenuButton() => MenuButton(
        onPressed: () {
          context.read<NavigationBloc>().add(NavigationEvent.menuClicked());
        },
      );

  double get _selectedVendingMachineHeightFactor {
    double height = mediaQuery.size.height * 0.6;
    if (height > 512) {
      return 512 / mediaQuery.size.height;
    } else {
      return 0.6;
    }
  }

  Widget _buildTakePowerBankButton() => Padding(
        padding: EdgeInsets.only(bottom: 8 + mediaQuery.viewPadding.bottom),
        child: BaseButton(
          text: localization.takePowerbank,
          width: 210,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          onPressed: () {
            sendEvent(VendingMachinesOnMapEvent.takePowerBankClicked());
          },
        ),
      );

  void _showRentCompletedMessage() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => MessageModal(
        title: localization.rentCompleted,
        mainButtonText: localization.continueText,
      ),
    );
  }
}
