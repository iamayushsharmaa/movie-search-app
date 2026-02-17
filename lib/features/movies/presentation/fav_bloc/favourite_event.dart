part of 'favourite_bloc.dart';


abstract class FavouriteEvent {}

class LoadFavourites extends FavouriteEvent {}

class ToggleFavouriteInList extends FavouriteEvent {
  final MovieEntity movie;

  ToggleFavouriteInList(this.movie);
}
