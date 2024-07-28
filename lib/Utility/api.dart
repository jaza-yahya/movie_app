


String get baseUrl => "https://api.themoviedb.org/3/";
String get imageBaseUrl => "https://image.tmdb.org/t/p/w780";


class Api {
  static String get token => "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzIxZGU0NmMxMDJjYTU4ZjJjN2M1MjlhOWJlNTY4ZSIsIm5iZiI6MTcyMjE1NjQ1My42Nzc2MSwic3ViIjoiNjZhMjEyOWVmZDVkNWM5YmZlZGRhM2VhIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.ddI202_EKoIHlV4oi1J7SxXimzNnFJSHVs2Mw8407KA";

  static String get getGenres => "$baseUrl/genre/movie/list";
  static String get getTrendingMovies => "$baseUrl/discover/movie";
  static String get movieDetails => "$baseUrl/movie";


}

extension UrlParse on String {

  Uri toUri() => Uri.parse(this);
 
}