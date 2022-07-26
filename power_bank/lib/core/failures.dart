class Failure {
  Failure._();

  factory Failure.request({int? code, String? error}) = RequestFailure;
  factory Failure.network() = NetworkFailure;
  factory Failure.undefined({Object? error}) = UndefinedFailure;
}

class RequestFailure extends Failure {
  RequestFailure({this.code, this.error}) : super._();
  final int? code;
  final String? error;
}

class NetworkFailure extends Failure {
  NetworkFailure() : super._();
}

class UndefinedFailure extends Failure {
  UndefinedFailure({this.error}) : super._();
  final Object? error;
}
