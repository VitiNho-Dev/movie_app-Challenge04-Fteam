// ignore_for_file: unused_import
import 'package:movie_app/app/module/home/domain/entities/genre.dart';
import 'package:movie_app/app/module/home/domain/entities/movie.dart';
import 'package:movie_app/app/module/home/domain/repositories/genre_irepository.dart';
import 'package:movie_app/app/module/home/domain/repositories/i_movie_repository.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_genre.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_movies.dart';
import 'package:movie_app/app/module/home/external/datasources/genre_datasource.dart';
import 'package:movie_app/app/module/home/external/datasources/movie_datasource.dart';
import 'package:movie_app/app/module/home/external/mappers/genre_mapper.dart';
import 'package:movie_app/app/module/home/external/mappers/movie_mapper.dart';
import 'package:movie_app/app/module/home/infra/datasources/i_genre_datasource.dart';
import 'package:movie_app/app/module/home/infra/datasources/i_movie_datasource.dart';
import 'package:movie_app/app/module/home/infra/repositories/genre_repository.dart';
import 'package:movie_app/app/module/home/infra/repositories/movie_repository.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/controllers/change_color.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_state.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_store.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/widgets/custom_app_bar.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/widgets/custom_card_movie.dart';
import 'package:movie_app/app/module/home/presenter/pages/movie_details_page/widgets/custom_app_bar.dart';
import 'package:movie_app/app/shared/services/http_client_uno.dart';
import 'package:movie_app/main.dart';

void main() {}
