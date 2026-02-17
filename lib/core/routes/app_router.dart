import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesearch/core/di/service_locator.dart';
import 'package:moviesearch/features/movies/presentation/detail_bloc/detail_bloc.dart';
import 'package:moviesearch/features/movies/presentation/fav_bloc/favourite_bloc.dart';
import 'package:moviesearch/features/movies/presentation/screens/detail_screen.dart';
import 'package:moviesearch/features/movies/presentation/screens/favourite_screen.dart';
import 'package:moviesearch/features/movies/presentation/screens/home_screen.dart';
import 'package:moviesearch/features/movies/presentation/screens/search_screen.dart';
import 'package:moviesearch/features/movies/presentation/search_bloc/search_bloc.dart';

import '../../widget_tree.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return WidgetTree(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),

        GoRoute(
          path: AppRoutes.favourites,
          name: 'favourites',
          builder: (context, state) {
            return BlocProvider(
              create: (_) => sl<FavouriteBloc>()..add(LoadFavourites()),
              child: const FavouriteScreen(),
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.search,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<SearchBloc>()),
            BlocProvider(
              create: (_) => sl<FavouriteBloc>()..add(LoadFavourites()),
            ),
          ],
          child: const SearchScreen(),
        );
      },
    ),

    GoRoute(
      path: '${AppRoutes.movie}/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<DetailBloc>()..add(LoadMovieDetail(id)),
            ),
            BlocProvider(
              create: (_) => sl<FavouriteBloc>()..add(LoadFavourites()),
            ),
          ],
          child: DetailScreen(movieId: id),
        );
      },
    ),
  ],
);
