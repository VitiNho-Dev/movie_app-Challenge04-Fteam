abstract class Failures {}

class MovieDatasourceNoInternetConnection implements Failures {
  final String message;

  MovieDatasourceNoInternetConnection({this.message = ''});
}

class GenreDatasourceNoInternetConnection implements Failures {
  final String message;

  GenreDatasourceNoInternetConnection({this.message = ''});
}
