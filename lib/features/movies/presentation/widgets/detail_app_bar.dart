import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesearch/core/common/circle_icon_button.dart';
import 'package:moviesearch/features/movies/domain/entities/movie_entity.dart';
import 'package:moviesearch/features/movies/presentation/fav_bloc/favourite_bloc.dart';

class DetailAppBar extends StatelessWidget {
  final MovieEntity movie;

  const DetailAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleIconButton(
              icon: Icons.arrow_back,
              onTap: () => context.pop(),
            ),
            CircleIconButton(
              icon: Icons.favorite_border,
              onTap: () {
                context.read<FavouriteBloc>().add(ToggleFavouriteInList(movie));
              },
            ),
          ],
        ),
      ),
    );
  }
}
