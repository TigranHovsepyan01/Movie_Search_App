import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../utils/constants.dart';

class MovieService {
  Future<List<Movie>> fetchMovies(String query) async {
    final url = '${Constants.baseUrl}/search/movie?api_key=${Constants.apiKey}&query=$query';

    print('Fetching movies from: $url');

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List movies = data['results'];

        if (movies.isEmpty) {
          throw Exception('No movies found for the search term.');
        }

        return movies.map((movie) => Movie.fromJson(movie)).toList();
      } else if (response.statusCode == 404) {
        throw Exception('No results found for the search term.');
      } else if (response.statusCode == 500) {
        throw Exception('Server error. Please try again later.');
      } else {
        throw Exception('Failed to load movies. Error code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Something went wrong. Please check your network and try again.');
    }
  }
}
