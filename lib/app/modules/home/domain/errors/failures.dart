abstract class Failures {}

class MovieDatasourceNoInternetConnection implements Failures {
  final String message;

  MovieDatasourceNoInternetConnection({
    this.message = 'Sem conexão',
  });
}
