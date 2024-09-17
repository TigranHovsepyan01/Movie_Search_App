import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/movie_provider.dart';

class FavoriteIcon extends StatelessWidget {
  final Movie movie;

  FavoriteIcon({required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return IconButton(
      icon: Icon(
        movieProvider.favorites.contains(movie)
            ? Icons.favorite
            : Icons.favorite_border,
        color: movieProvider.favorites.contains(movie)
            ? Colors.red
            : Colors.grey,
      ),
      onPressed: () {
        movieProvider.toggleFavorite(movie);
      },
    );
  }
}
