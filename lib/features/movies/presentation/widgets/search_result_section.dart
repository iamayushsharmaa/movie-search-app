import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesearch/features/movies/domain/entities/movie_entity.dart';
import 'package:moviesearch/features/movies/presentation/widgets/movie_card_widget.dart';

import '../../../../core/routes/app_routes.dart';

class SearchResultSection extends StatelessWidget {
  final List<MovieEntity> movies;

  const SearchResultSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(child: Text('No movies found'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${movies.length} movies found',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final movie = movies[index];

              return GestureDetector(
                onTap: () {
                  context.push('${AppRoutes.movie}/${movie.imdbID}');
                },
                child: MovieCard(
                  movie: movie,
                  onTap: () {
                    context.push('${AppRoutes.movie}/${movie.imdbID}');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
