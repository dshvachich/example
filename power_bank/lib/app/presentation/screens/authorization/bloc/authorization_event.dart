part of 'authorization_bloc.dart';

@freezed
class AuthorizationEvent with _$AuthorizationEvent {
  factory AuthorizationEvent.phoneChanged(PhoneNumber phone) = PhoneChanged;
  factory AuthorizationEvent.sendCodeClicked() = SendCodeClicked;
  factory AuthorizationEvent.backClicked() = BackClicked;
  factory AuthorizationEvent.privacyPolicyClicked() = PrivacyPolicyClicked;
  factory AuthorizationEvent.startNumberEntering() = StartNumberEntering;
  factory AuthorizationEvent.endNumberEntering() = EndNumberEntering;
  factory AuthorizationEvent.termsOfUseClicked() = TermsOfUseClicked;
}
