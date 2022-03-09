import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:movie_app/app/app_module.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_movies_usecase.dart';

void main() {
  setUpAll(() {
    initModule(AppModule());
  });

  test('Deve retornar um success', () {
    final usecase = Modular.get<GetMovieUsecase>();
    expect(usecase, isA<GetMovieUsecase>());
  });
}
