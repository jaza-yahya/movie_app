import 'package:flutter/material.dart';
import 'package:movieapp/Shared/Models/discover_movies_model.dart';
import 'package:movieapp/Shared/Services/movies_service.dart';

import '../Models/movie_details_model.dart';

class MoviesProvider extends ChangeNotifier {

  List<Genre> _genres = [];

  List<Genre> get getGenres => _genres;

  void setGenres(List<Genre> genres) {
    _genres = genres;
    notifyListeners();
  }

  Future<void> fetchGenres() async {
    final genres = await MoviesService().getGenres();
    setGenres(genres);
  }
  //////////////////
  //////////////////
  MoviesDiscoverModel _movies = MoviesDiscoverModel();
  MoviesDiscoverModel get getMovies => _movies;


  void setMovies(MoviesDiscoverModel movies) {
    _movies = movies;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    final movies = await MoviesService().getMovies();
    setMovies(movies);
  }
  /////////////////////////////
  ///////////MOVIE DETAILS
  
  MovieDetailsModel _movieDetails = MovieDetailsModel();
  MovieDetailsModel get getMovieDetails => _movieDetails;

  void setMovieDetails(MovieDetailsModel movieDetails) { 
    _movieDetails = movieDetails;
    notifyListeners();
  }

  Future<void> fetchMovieDetails(int movieId) async {
    final movieDetails = await MoviesService().getMovieDetails(movieId);
    setMovieDetails(movieDetails);
  }


  
}