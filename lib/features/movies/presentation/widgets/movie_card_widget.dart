import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesearch/features/movies/domain/entities/movie_entity.dart'
    show MovieEntity;
import 'package:moviesearch/features/movies/presentation/fav_bloc/favourite_bloc.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback? onTap;

  const MovieCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        bool isFav = false;

        if (state is FavouriteLoaded) {
          isFav = state.movies.any((m) => m.imdbID == movie.imdbID);
        }

        return GestureDetector(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          movie.poster != 'N/A'
                              ? movie.poster
                              : 'https://via.placeholder.com/300x450',
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            context.read<FavouriteBloc>().add(
                              ToggleFavouriteInList(movie),
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                key: ValueKey(isFav),
                                color: isFav
                                    ? Colors.red
                                    : Colors.grey.shade300,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 1),

              Text(
                movie.year,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}
