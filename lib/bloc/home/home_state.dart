// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../models/genres/genre.dart';
import '../../models/movie/movie.dart';

class HomeState {
  List<Movie> topMoviesList;
  List<Movie> newReleasesList;
  List<Genre> genresList;
  HomeState({
    this.topMoviesList = const [],
    this.newReleasesList = const [],
    this.genresList = const [],
  });

  HomeState copyWith({
    List<Movie>? topMoviesList,
    List<Movie>? newReleasesList,
    List<Genre>? genresList,
  }) {
    return HomeState(
      topMoviesList: topMoviesList ?? this.topMoviesList,
      newReleasesList: newReleasesList ?? this.newReleasesList,
      genresList: genresList ?? this.genresList,
    );
  }
}
