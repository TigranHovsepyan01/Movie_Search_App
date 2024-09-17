// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/movie_provider.dart';
// import '../widgets/movie_list_item.dart';
//
// class SearchScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final movieProvider = Provider.of<MovieProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movie Search'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: 'Enter movie name',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (query) {
//                 if (query.isNotEmpty) {
//                   movieProvider.searchMovies(query);
//                 }
//               },
//             ),
//             const SizedBox(height: 10),
//             movieProvider.isLoading
//                 ? const CircularProgressIndicator()
//                 : movieProvider.errorMessage.isNotEmpty
//                 ? Text(movieProvider.errorMessage)
//                 : Expanded(
//               child: ListView.builder(
//                 itemCount: movieProvider.movies.length,
//                 itemBuilder: (context, index) {
//                   return MovieListItem(
//                     movie: movieProvider.movies[index],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_list_item.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter movie name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) {
                  if (query.isNotEmpty) {
                    movieProvider.searchMovies(query);
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            movieProvider.isLoading
                ? const CircularProgressIndicator()
                : movieProvider.errorMessage.isNotEmpty
                ? Text(movieProvider.errorMessage)
                : Expanded(
              child: movieProvider.movies.isEmpty
                  ? const Center(
                child: Text(
                  'No movies found',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: movieProvider.movies.length,
                itemBuilder: (context, index) {
                  return MovieListItem(
                    movie: movieProvider.movies[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
