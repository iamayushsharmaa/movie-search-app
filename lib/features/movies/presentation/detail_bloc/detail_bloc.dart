import 'package:bloc/bloc.dart';
import 'package:moviesearch/features/movies/domain/entities/movie_entity.dart'
    show MovieEntity;
import 'package:moviesearch/features/movies/domain/usecases/get_movie_detail_usecase.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetMovieDetail getMovieDetail;

  DetailBloc({required this.getMovieDetail}) : super(DetailInitial()) {
    on<LoadMovieDetail>(_onLoadDetail);
  }

  Future<void> _onLoadDetail(
    LoadMovieDetail event,
    Emitter<DetailState> emit,
  ) async {
    emit(DetailLoading());

    try {
      final movie = await getMovieDetail(event.imdbId);
      emit(DetailLoaded(movie));
    } catch (e) {
      emit(DetailError(e.toString()));
    }
  }
}
