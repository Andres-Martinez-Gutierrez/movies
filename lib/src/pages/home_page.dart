import 'package:flutter/material.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:provider/provider.dart';

import 'package:peliculas/src/providers/movies_provider.dart';
import 'package:peliculas/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Películas en cines')),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () =>
                    showSearch(context: context, delegate: PeliculasSearch()),
                icon: const Icon(Icons.search_outlined)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              // Slider de películas
              MovieHorizontal(
                movies: moviesProvider.popularMovies, // populares,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(), // opcional
              ),
            ],
          ),
        ));
  }
}
