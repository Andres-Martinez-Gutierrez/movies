import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/movie.dart';
import 'package:peliculas/src/widgets/casting_cards.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CrearCustomAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 10.0,
                ),
                _PosterAndTittle(
                  movie: movie,
                ),
                _OverView(
                  movie: movie,
                ),
                CastingCards(movie.id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CrearCustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CrearCustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 15),
        title: FadeIn(
          delay: Duration(milliseconds: 300),
          child: Text(movie.title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
        background: FadeInImage(
          image: NetworkImage(movie.fullBackdropPath),
          placeholder: const AssetImage('assets/img/loading.gif'),
          fadeInDuration: const Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTittle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTittle({super.key, required this.movie});

  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: const AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: 150.0,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_border_rounded),
                    Text(
                      movie.voteAverage.toString(),
                      style: textTheme.subtitle1,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final Movie movie;
  const _OverView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
