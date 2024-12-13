import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';


//Con esto, facilmenet peudo cambair los orignees de datos, lalmando a esta implelmenmtancion puedo cambiar de fuente de datos
class MovieRepositoryImpl extends MoviesRepository {
  
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPLaying({int page = 1}) {
    return this.datasource.getNowPLaying(page: page);
  }



}

