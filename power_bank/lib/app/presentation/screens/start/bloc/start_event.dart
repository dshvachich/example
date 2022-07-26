part of 'start_bloc.dart';

@freezed
class StartEvent with _$StartEvent {
  factory StartEvent.init() = Init;
  factory StartEvent.repeatClicked() = RepeatClicked;
}
