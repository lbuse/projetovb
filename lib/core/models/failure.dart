abstract class Failure {
  const Failure({
    this.errorCode,
    required this.message,
  });

  final int? errorCode;
  final String message;
}

/// General Server Failures
class ServerFailure extends Failure {
  const ServerFailure({
    required int statusCode,
    required String message,
  }) : super(
          errorCode: statusCode,
          message: message,
        );
}

class GeneralFailure extends Failure {
  const GeneralFailure({
    required String message,
  }) : super(message: message);
}
