// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mova_app/models/enums/bloc_status.dart';
import 'package:mova_app/models/genres/genre.dart';
import 'package:mova_app/models/regions/regions.dart';

import '../../models/movie/movie.dart';

class ExploreState {
  String currentRegion;
  String currentGenre;
  String currentYear;
  bool hasSelected;
  List<Movie> movies;
  List<Genre> genresList;
  List<Region> regions;
  BlocStatus status;
  ExploreState({
    this.currentRegion = '',
    this.currentGenre = '',
    this.currentYear = '',
    this.hasSelected = false,
    this.movies = const [],
    this.genresList = const [],
    this.regions = const [],
    this.status = BlocStatus.initial,
  });

  ExploreState copyWith({
    String? currentRegion,
    String? currentGenre,
    String? currentYear,
    bool? hasSelected,
    List<Movie>? movies,
    List<Genre>? genresList,
    List<Region>? regions,
    BlocStatus? status,
  }) {
    return ExploreState(
      currentRegion: currentRegion ?? this.currentRegion,
      currentGenre: currentGenre ?? this.currentGenre,
      currentYear: currentYear ?? this.currentYear,
      hasSelected: hasSelected ?? this.hasSelected,
      movies: movies ?? this.movies,
      genresList: genresList ?? this.genresList,
      regions: regions ?? this.regions,
      status: status ?? this.status,
    );
  }
}
