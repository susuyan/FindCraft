enum NoyaErrorType { SERVER, DEFAULT }

class NoyaError implements Exception {
  NoyaError({
    this.type = NoyaErrorType.DEFAULT,
    this.error,
  });

  NoyaErrorType type;

  /// The original error/exception object; It's usually not null when `type`
  /// is DioErrorType.DEFAULT
  dynamic error;

  String get message => (error?.toString() ?? "");

  String toString() {
    var msg = "Noya Error [$type]: $message";
    if (error is Error) {
      msg += "\n${error.stackTrace}";
    }
    return msg;
  }
}
