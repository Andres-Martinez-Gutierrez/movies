import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas/src/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // ignore: unrelated_type_equality_checks
    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: screenSize.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
      width: double.infinity,
      height: screenSize.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemCount: movies.length,
        itemWidth: screenSize.width * 0.6,
        itemHeight: screenSize.height * 0.9,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          movie.heroId = 'swiper-${movie.id}';
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/img/loading.gif'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        //pagination: const SwiperPagination(),
        //control: SwiperControl(),
      ),
    );
  }
}
