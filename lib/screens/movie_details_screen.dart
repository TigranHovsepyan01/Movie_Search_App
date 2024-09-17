import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

   MovieDetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Release Date: ${movie.releaseDate}'),
            const SizedBox(height: 10),
            Text('Rating: ${movie.rating.toString()}'),
            const SizedBox(height: 16),
            Text(movie.overview),
          ],
        ),
      ),
    );
  }
}
