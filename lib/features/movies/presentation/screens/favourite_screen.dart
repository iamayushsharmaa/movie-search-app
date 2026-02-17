import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesearch/core/routes/app_routes.dart';
import 'package:moviesearch/features/movies/presentation/fav_bloc/favourite_bloc.dart';
import 'package:moviesearch/features/movies/presentation/widgets/movie_card_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Favourites',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: _buildBody(context, state),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, FavouriteState state) {
    if (state is FavouriteLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is FavouriteLoaded) {
      if (state.movies.isEmpty) {
        return const Center(child: Text('No favourites added yet'));
      }

      return GridView.builder(
        itemCount: state.movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final movie = state.movies[index];

          return MovieCard(
            movie: movie,
            onTap: () {
              context.push('${AppRoutes.movie}/${movie.imdbID}');
            },
          );
        },
      );
    }

    if (state is FavouriteError) {
      return Center(child: Text(state.message));
    }

    return const SizedBox();
  }
}
