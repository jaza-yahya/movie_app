import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/Shared/Models/discover_movies_model.dart';
import 'package:movieapp/Shared/Models/movie_details_model.dart';
import 'package:movieapp/Utility/api.dart';
import 'package:http/http.dart' as http;

class MoviesService {
  Future<List<Genre>> getGenres() async {
    List<Genre> genres = [];

    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Api.token}',
      };
      final response = await http.get(Api.getGenres, headers: headers);
      if (response.statusCode == 200) {
        debugPrint("GET GENRES SUCCESS");
        final data = jsonDecode(response.body);
        genres = List<Genre>.from(data['genres'].map((x) => Genre.fromJson(x)));
        debugPrint("GENRES: $genres");
      } else {
        debugPrint("GET GENRES FAILED");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return genres;
  }

  ///////////////////////////////////////////
  ////////////////////////////////////////////
  ///GET MOVIES
  Future<MoviesDiscoverModel> getMovies({required int page}) async {
    MoviesDiscoverModel movies = MoviesDiscoverModel();
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Api.token}',
      };
      final queryParams = {
        'page': page.toString(),
        "include_adult": "false",
        "include_video": "false",
        "language": "en-US",
      };
      final response = await http.get(
        Api.getTrendingMovies.replace(queryParameters: queryParams),
        headers: headers,
      );
      if (response.statusCode == 200) {
        debugPrint("GET MOVIES SUCCESS");
        final data = jsonDecode(response.body);
        movies = MoviesDiscoverModel.fromJson(data);
        debugPrint("MOVIES: ${movies.movies}.");
      } else {
        debugPrint("GET MOVIES FAILED");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return movies;
  }
  /////////////////////////////
  ////////////
  ///GET MOVIE DETAILS
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    MovieDetailsModel movieDetails = MovieDetailsModel();
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Api.token}',
      };
     
      final response = await http.get(
        Api.movieDetails.resolve("movie/${id.toString()}"),
        headers: headers,
      );
      if (response.statusCode == 200) {
        debugPrint("GET MOVIE DETAILS SUCCESS");
        final data = jsonDecode(response.body);
        movieDetails = MovieDetailsModel.fromJson(data);
        debugPrint("MOVIE DETAILS: $movieDetails.");
      } else {
        debugPrint("GET MOVIE DETAILS FAILED ${response.body}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return movieDetails;
  }
  //////////////////////////////////////
  ///////////SEARCH MOVIES
  Future<MoviesDiscoverModel> searchMovies({required String query}) async {
    MoviesDiscoverModel movies = MoviesDiscoverModel();
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Api.token}',
      };
      final queryParams = {
        "query": query,
        'page': "1",
        "include_adult": "false",
        "language": "en-US",
      };
      final response = await http.get(
        Api.searchMovies.replace(queryParameters: queryParams),
        headers: headers,
      );
      if (response.statusCode == 200) {
        debugPrint("SEARCH MOVIES SUCCESS");
        final data = jsonDecode(response.body);
        movies = MoviesDiscoverModel.fromJson(data);
        debugPrint("MOVIES: ${movies.movies}.");
      } else {
        debugPrint("SEARCH MOVIES FAILED");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return movies;
  }
}
