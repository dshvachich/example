import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:power_bank/app/bloc/app_bloc.dart';
import 'package:power_bank/app/resources/map_style.dart';
import 'package:power_bank/core/bloc/base_bloc_state.dart';
import 'package:power_bank/core/bloc/bloc_action.dart';
import 'package:power_bank/core/enums/message_type.dart';
import 'package:power_bank/core/failures.dart';
import 'package:power_bank/data/gateways/local/preferences_local_gateway.dart';
import 'package:power_bank/data/repositories/notifications_repository.dart';
import 'package:power_bank/data/repositories/product_rent_repository.dart';
import 'package:power_bank/data/repositories/vending_machines_repository.dart';
import 'package:power_bank/data/web_socket_manager.dart';
import 'package:power_bank/domain/entities/network/product_rent.dart';
import 'package:power_bank/domain/entities/network/vending_machine.dart';
import 'package:power_bank/localization/app_localizations.dart';

part 'vending_machines_on_map_bloc.freezed.dart';
part 'vending_machines_on_map_event.dart';
part 'vending_machines_on_map_state.dart';

class VendingMachinesOnMapBloc extends Bloc<VendingMachinesOnMapEvent, VendingMachinesOnMapState> {
  VendingMachinesOnMapBloc({
    required this.vendingMachinesRepository,
    required this.productRentRepository,
    required this.notificationsRepository,
    required this.preferencesLocalGateway,
    required this.webSocketManager,
    required this.localization,
    required this.appBloc,
  }) : super(VendingMachinesOnMapState()) {
    on<Init>(_init);
    on<TakePowerBankClicked>(_takePowerBankClicked);
    on<BackClicked>(_backClicked);
    on<TimeToCheckActiveRent>(_timeToCheckActiveRent);
    on<UserPositionUpdated>(_userPositionUpdated);
    on<ProductRentCompleted>(_productRentCompleted);
    on<ScreenOpened>(_screenOpened);
    on<OnMapCreated>(_onMapCreated);
    on<VendingMachineOnMapClicked>(_vendingMachineOnMapClicked);
    on<VendingMachineSelectClicked>(_vendingMachineSelectClicked);
    on<CloseVendingMachineInfoClicked>(_closeVendingMachineInfoClicked);
    on<OnCameraMove>(_onCameraMove);
    on<OnMapTap>(_onMapTap);
    on<SupportServiceClicked>(_supportServiceClicked);
    on<MyLocationClicked>(_myLocationClicked);
    on<BottomSheetOffsetChanged>(_bottomSheetOffsetChanged);
    this.add(VendingMachinesOnMapEvent.init());
  }

  VendingMachinesRepository vendingMachinesRepository;
  ProductRentRepository productRentRepository;
  PreferencesLocalGateway preferencesLocalGateway;
  WebSocketManager webSocketManager;
  NotificationsRepository notificationsRepository;
  AppBloc appBloc;
  AppLocalizations localization;
  GoogleMapController? _mapController;
  StreamSubscription? _rentSubscription;
  StreamSubscription? _lifecycleSubscription;
  StreamSubscription? _positionSubscription;

  FutureOr<void> _init(
    Init event,
    Emitter<VendingMachinesOnMapState> emit,
  ) async {
    _lifecycleSubscription?.cancel();
    _lifecycleSubscription = appBloc.appLifecycleStateStream.listen((state) {
      if (state == AppLifecycleState.resumed) {
        this.add(VendingMachinesOnMapEvent.screenOpened());
      }
    });
    _rentSubscription?.cancel();
    _rentSubscription = webSocketManager.completeRentStream.listen((product) {
      if (product != null) {
        this.add(VendingMachinesOnMapEvent.productRentCompleted(product));
      }
    });
    await Future.wait([
      _getActiveRent(emit),
      _setUpLocationListener(emit),
      _fetchVendingMachines(emit),
    ]);
  }

  Future<void> _setUpLocationListener(Emitter<VendingMachinesOnMapState> emit) async {
    emit(state.copyWith(action: null));
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(state.copyWith(action: ShowAlertMessage(messageType: MessageType.noGeoPermission)));
      return null;
    } else {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      } else if (permission == LocationPermission.deniedForever) {
        emit(state.copyWith(action: ShowAlertMessage(messageType: MessageType.noGeoPermission)));
        return null;
      } else {
        _positionSubscription?.cancel();
        _positionSubscription =
            Geolocator.getPositionStream(locationSettings: LocationSettings(distanceFilter: 10)).listen((data) {
          this.add(VendingMachinesOnMapEvent.userPositionUpdated(data));
        });
      }
    }
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    _rentSubscription?.cancel();
    _lifecycleSubscription?.cancel();
    _positionSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onMapCreated(
    OnMapCreated event,
    Emitter<VendingMachinesOnMapState> emit,
  ) async {
    _mapController = event.controller;
    emit(state.copyWith(mapLoaded: true));
  }

  Future<void> _fetchVendingMachines(Emitter<VendingMachinesOnMapState> emit) async {
    Either<List<VendingMachine>, Failure> result = await vendingMachinesRepository.getVendingMachines(limit: 5000);

    List<VendingMachine> machines = [];
    result.fold(
      (data) => machines = data,
      (failure) => null,
    );
    emit(state.copyWith(vendingMachines: machines));
  }

  FutureOr<void> _vendingMachineOnMapClicked(
    VendingMachineOnMapClicked event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {
    VendingMachine machine = event.machine;
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(machine.latitude, machine.longitude),
      ),
    );

    if (machine != state.selectedVendingMachine) {
      emit(state.copyWith(selectedVendingMachine: null));
      emit(state.copyWith(selectedVendingMachine: machine));
    }
  }

  FutureOr<void> _closeVendingMachineInfoClicked(
    CloseVendingMachineInfoClicked event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {
    emit(state.copyWith(selectedVendingMachine: null));
  }

  FutureOr<void> _onCameraMove(
    OnCameraMove event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {
    emit(state.copyWith(cameraPosition: event.position));
  }

  FutureOr<void> _onMapTap(
    OnMapTap event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {
    if (state.selectedVendingMachine != null) {
      emit(state.copyWith(selectedVendingMachine: null, bottomSheetOffset: 0));
    }
  }

  FutureOr<void> _myLocationClicked(
    MyLocationClicked event,
    Emitter<VendingMachinesOnMapState> emit,
  ) async {
    if (state.userPosition != null) {
      CameraPosition newCameraPosition = CameraPosition(
        target: LatLng(state.userPosition!.latitude, state.userPosition!.longitude),
        zoom: 16,
      );
      emit(state.copyWith(cameraPosition: newCameraPosition));
      _mapController?.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
    }
  }

  FutureOr<void> _vendingMachineSelectClicked(
    VendingMachineSelectClicked event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {}

  FutureOr<void> _bottomSheetOffsetChanged(
    BottomSheetOffsetChanged event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {
    emit(state.copyWith(bottomSheetOffset: event.offset));
    print('offset = ${event.offset}');
    if (event.offset <= 1) {
      emit(state.copyWith(selectedVendingMachine: null));
    }
  }

  FutureOr<void> _screenOpened(
    ScreenOpened event,
    Emitter<VendingMachinesOnMapState> emit,
  ) async {
    _mapController?.setMapStyle(mapStyle);
    await _getActiveRent(emit);
  }

  FutureOr<void> _supportServiceClicked(
    SupportServiceClicked event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {}

  Future<void> _getActiveRent(Emitter<VendingMachinesOnMapState> emit) async {}

  FutureOr<void> _backClicked(
    event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {
    if (state.selectedVendingMachine != null) {
      emit(state.copyWith(selectedVendingMachine: null));
    } else {
      SystemNavigator.pop();
    }
  }

  Future<FutureOr<void>> _productRentCompleted(
    ProductRentCompleted event,
    Emitter<VendingMachinesOnMapState> emit,
  ) async {
    await _getActiveRent(emit);
  }

  Future<FutureOr<void>> _timeToCheckActiveRent(
    TimeToCheckActiveRent event,
    Emitter<VendingMachinesOnMapState> emit,
  ) async {
    print('');
    await _getActiveRent(emit);
  }

  FutureOr<void> _takePowerBankClicked(
    TakePowerBankClicked event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {}

  FutureOr<void> _userPositionUpdated(
    UserPositionUpdated event,
    Emitter<VendingMachinesOnMapState> emit,
  ) {
    emit(state.copyWith(userPosition: event.position));
  }
}
