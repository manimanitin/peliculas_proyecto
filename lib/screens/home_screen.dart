import 'package:flutter/material.dart';
import 'package:peliculas_proyecto/providers/movies_provider.dart';
import 'package:peliculas_proyecto/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            )
          ],
          elevation: 0,
          title: const Center(
            child: Text('Peliculas en cine'),
          ),
        ),
        body: Column(children: [
          CardSwiper(
            movies: moviesProvider.onDisplayMovies,
          ),
          MovieSlider(
            movies: moviesProvider.popularMovies,
          ),
        ]),
      ),
    );
  }
}
