import 'package:flutter/material.dart';
import 'package:movieapp/Shared/Models/movie_details_model.dart';

double scrennWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double scrennHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
List<Genre> getGenresById(List<Genre> genres, List<int> ids) {
  return  genres.where((genre) => ids.contains(genre.id)).toList();
}