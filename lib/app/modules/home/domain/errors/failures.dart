abstract class Failures implements Exception {}

class InvalidTextError implements Failures {
  final String messageError;

  InvalidTextError({this.messageError = ''});
}

class DatasourceConnect implements Failures {}
