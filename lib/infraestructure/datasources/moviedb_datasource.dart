import 'package:dio/dio.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource{
  final dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': 'Environment.theMovieDbKey',
      'language': 'es-MX'
    }
    ));

  @override
  Future<List<Movie>> getNowPLaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing');
    
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    
    final List<Movie> movies = movieDbResponse.results
    //si el poster no existe, no se va a renderizar la pelicula
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb))
    .toList();


    return movies;
  }

}