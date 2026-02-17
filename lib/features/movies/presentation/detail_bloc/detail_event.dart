part of 'detail_bloc.dart';

abstract class DetailEvent {}

class LoadMovieDetail extends DetailEvent {
  final String imdbId;
  LoadMovieDetail(this.imdbId);
}
