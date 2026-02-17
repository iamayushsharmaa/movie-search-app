import 'package:bloc/bloc.dart';
import 'package:moviesearch/features/movies/domain/entities/movie_entity.dart';
import 'package:moviesearch/features/movies/domain/usecases/get_favourite_usecase.dart';
import 'package:moviesearch/features/movies/domain/usecases/toggle_favourite_usecase.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final GetFavourites getFavourites;
  final ToggleFavourite toggleFavourite;

  FavouriteBloc({required this.getFavourites, required this.toggleFavourite})
    : super(FavouriteInitial()) {
    on<LoadFavourites>(_onLoadFavourites);
    on<ToggleFavouriteInList>(_onToggleFavourite);
  }

  Future<void> _onLoadFavourites(
    LoadFavourites event,
    Emitter<FavouriteState> emit,
  ) async {
    try {
      emit(FavouriteLoading());
      final favourites = await getFavourites();
      emit(FavouriteLoaded(favourites));
    } catch (e) {
      emit(FavouriteError(e.toString()));
    }
  }

  Future<void> _onToggleFavourite(
    ToggleFavouriteInList event,
    Emitter<FavouriteState> emit,
  ) async {
    await toggleFavourite(event.movie);

    final updated = await getFavourites();
    emit(FavouriteLoaded(updated));
  }
}
