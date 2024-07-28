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
      final response = await http.get(Api.getGenres.toUri(), headers: headers);
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
  Future<MoviesDiscoverModel> getMovies() async {
    MoviesDiscoverModel movies = MoviesDiscoverModel();
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Api.token}',
      };
      final queryParams = {
        'page': "1",
        "include_adult": "false",
        "include_video": "false",
        "language": "en-US",
      };
      final response = await http.get(
        Api.getTrendingMovies.toUri().replace(queryParameters: queryParams),
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
}
