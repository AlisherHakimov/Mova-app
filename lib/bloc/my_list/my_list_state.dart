// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mova_app/models/genres/genre.dart';

import '../../models/movie/movie.dart';

class MyListState {
  int? currentGenreId;
  List<Genre> genresList;
  List<Movie> myMoviesList;
  MyListState({
    this.currentGenreId,
    this.genresList = const [],
    this.myMoviesList = const [],
  });

  MyListState copyWith({
    int? currentGenreId,
    List<Genre>? genresList,
    List<Movie>? myMoviesList,
  }) {
    return MyListState(
      currentGenreId: currentGenreId ?? currentGenreId,
      genresList: genresList ?? this.genresList,
      myMoviesList: myMoviesList ?? this.myMoviesList,
    );
  }
}
