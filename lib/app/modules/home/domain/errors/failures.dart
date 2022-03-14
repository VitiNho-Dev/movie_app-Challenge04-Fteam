abstract class Failures {
  final StackTrace? stackTrace;
  final String message;

  Failures({
    this.stackTrace,
    required this.message,
  });
}

class MovieDatasourceNoInternetConnection extends Failures {
  MovieDatasourceNoInternetConnection(
      {required String message, StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}

class GenreDatasourceNoInternetConnection extends Failures {
  GenreDatasourceNoInternetConnection(
      {required String message, StackTrace? stackTrace})
      : super(message: message, stackTrace: stackTrace);
}
