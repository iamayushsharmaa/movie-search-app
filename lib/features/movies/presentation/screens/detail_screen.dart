import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesearch/core/common/circle_icon_button.dart';
import 'package:moviesearch/features/movies/presentation/detail_bloc/detail_bloc.dart';
import 'package:moviesearch/features/movies/presentation/fav_bloc/favourite_bloc.dart';
import 'package:moviesearch/features/movies/presentation/widgets/detail_info_card.dart';
import 'package:moviesearch/features/movies/presentation/widgets/detail_poster.dart';

class DetailScreen extends StatelessWidget {
  final String movieId;

  const DetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DetailLoaded) {
            final movie = state.movie;

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.5,
                  pinned: true,
                  backgroundColor: Colors.white,
                  leadingWidth: 56,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CircleIconButton(
                      icon: Icons.arrow_back,
                      onTap: () => context.pop(),
                    ),
                  ),
                  actions: [
                    BlocBuilder<FavouriteBloc, FavouriteState>(
                      builder: (context, favState) {
                        bool isFav = false;

                        if (favState is FavouriteLoaded) {
                          isFav = favState.movies.any(
                            (m) => m.imdbID == movie.imdbID,
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {
                              context.read<FavouriteBloc>().add(
                                ToggleFavouriteInList(movie),
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  key: ValueKey(isFav),
                                  color: isFav ? Colors.red : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: DetailPoster(posterUrl: movie.poster),
                  ),
                ),

                SliverToBoxAdapter(child: DetailInfoCard(movie: movie)),
              ],
            );
          }

          if (state is DetailError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
