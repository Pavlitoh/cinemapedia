import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource{
  final dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': 'Environment.theMovieDbKey',
      'language': 'es-MX'
    }
    ));

  @override
  Future<List<Movie>> getNowPLaying({int page = 1}) async {

    final reponse = await dio.get('/movie/now_playing');
    final List<Movie> movies = [];


    return [];
  }

}