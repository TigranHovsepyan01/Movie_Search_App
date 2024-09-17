import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  bool _isLoading = false;
  String _errorMessage = '';
 final List<Movie> _favorites = [];

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<Movie> get favorites => _favorites;

  void searchMovies(String query) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _movies = await MovieService().fetchMovies(query);
    } catch (e) {
      _errorMessage = 'Failed to fetch movies. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(Movie movie) {
    if (_favorites.contains(movie)) {
      _favorites.remove(movie);
    } else {
      _favorites.add(movie);
    }
    notifyListeners();
  }
}
