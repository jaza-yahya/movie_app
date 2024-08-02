import 'dart:convert';

import 'package:movieapp/Shared/Models/discover_movies_model.dart';
import 'package:movieapp/Shared/Models/movie_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesPreferences {
  MoviesPreferences._internal();
  static final _instance = MoviesPreferences._internal();
  static MoviesPreferences get to => _instance;

  Future<void> saveMovies(MoviesDiscoverModel movies) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(movies.page.toString(), jsonEncode(movies.toJson()));
  }

  Future<MoviesDiscoverModel?> getMovies(int page) async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(page.toString());
    if (json != null) {
      return MoviesDiscoverModel.fromJson(jsonDecode(json));
    }
    return null;
  }
  /////////////////
  void saveGenres(List<Genre> genres) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('genres', jsonEncode(genres));
  }

  Future<List<Genre>?> getGenres() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('genres');
    if (json != null) { 
      return List<Genre>.from(jsonDecode(json).map((x) => Genre.fromJson(x)));
    }
    return null;
  }
  ////////////
  ////
  void saveTotalPages(int totalPages) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('totalPages', totalPages);
  }

  Future<int?> getTotalPages() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('totalPages');
  }
  //////////////////
  void saveMovieDetails (MovieDetailsModel movie)async{
    final prefs = await SharedPreferences.getInstance();
    if (movie.id != null) {
      
    await prefs.setString(movie.id.toString(), jsonEncode(movie.toJson()));
    }


  }

  Future<MovieDetailsModel?> getMovieDetails(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(movieId.toString());
    if (json != null) {
      return MovieDetailsModel.fromJson(jsonDecode(json));
    }
    return null;
  }
}
