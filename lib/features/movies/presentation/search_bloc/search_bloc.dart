import 'package:bloc/bloc.dart';
import 'package:moviesearch/features/movies/domain/entities/movie_entity.dart'
    show MovieEntity;
import 'package:moviesearch/features/movies/domain/usecases/search_movies_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMoviesUsecase searchMovies;

  SearchBloc({required this.searchMovies}) : super(SearchInitial()) {
    on<SearchMoviesEvent>(_onSearch);
    on<ClearSearchEvent>((event, emit) {
      emit(SearchInitial());
    });
  }

  Future<void> _onSearch(
    SearchMoviesEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final movies = await searchMovies(event.query);

      if (movies.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded(movies));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
