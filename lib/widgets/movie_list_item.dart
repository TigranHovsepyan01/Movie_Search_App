import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/movie_provider.dart';
import '../screens/movie_details_screen.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  MovieListItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return ListTile(
      leading: Image.network(
        'https://image.tmdb.org/t/p/w92${movie.posterPath}',
        width: 50,
        fit: BoxFit.cover,
      ),
      title: Text(movie.title),
      subtitle: Text('Release Year: ${movie.releaseDate}'),
      trailing: IconButton(
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
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movie: movie),
          ),
        );
      },
    );
  }
}
