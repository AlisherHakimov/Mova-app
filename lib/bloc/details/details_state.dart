// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mova_app/models/videos/video.dart';

import '../../models/details/details.dart';
import '../../models/genres/genre.dart';
import '../../models/movie/movie.dart';

class DetailsState {
  Details? movieDetails;
  List<Movie> similarMovies;
  List<Genre> genresList;
  List<dynamic> personsList;
  List<Video> trailers;
  int? messagesCount;
  DetailsState({
    this.movieDetails,
    this.similarMovies = const [],
    this.genresList = const [],
    this.personsList = const [],
    this.trailers = const [],
    this.messagesCount,
  });

  DetailsState copyWith({
    Details? movieDetails,
    List<Movie>? similarMovies,
    List<Genre>? genresList,
    List<dynamic>? personsList,
    List<Video>? trailers,
    int? messagesCount,
  }) {
    return DetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      similarMovies: similarMovies ?? this.similarMovies,
      genresList: genresList ?? this.genresList,
      personsList: personsList ?? this.personsList,
      trailers: trailers ?? this.trailers,
      messagesCount: messagesCount ?? this.messagesCount,
    );
  }
}
