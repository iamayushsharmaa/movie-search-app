import 'package:flutter/material.dart';
import 'package:moviesearch/features/movies/presentation/widgets/cast_crew_section.dart';
import 'package:moviesearch/features/movies/presentation/widgets/genre_chip.dart';
import 'package:moviesearch/features/movies/presentation/widgets/plot_widget.dart';
import 'package:moviesearch/features/movies/presentation/widgets/rating_section_widget.dart';

import '../../domain/entities/movie_entity.dart';

class DetailInfoCard extends StatelessWidget {
  final MovieEntity movie;

  const DetailInfoCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final genres = movie.genre?.split(',') ?? [];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            movie.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            '${movie.year} • ${movie.rated ?? 'N/A'} • ${movie.runtime ?? 'N/A'}',
            style: const TextStyle(
              color: Colors.lightBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: genres
                .map((genre) => GenreChip(label: genre.trim()))
                .toList(),
          ),

          const SizedBox(height: 16),

          RatingsSection(
            imdb: movie.imdbRating,
            rottenTomatoes: movie.rottenTomatoesRating,
            metacritic: movie.metacriticRating,
          ),

          const SizedBox(height: 16),

          PlotSection(plot: movie.plot),

          const SizedBox(height: 24),

          CastCrewSection(actors: movie.actors, director: movie.director),
        ],
      ),
    );
  }
}
