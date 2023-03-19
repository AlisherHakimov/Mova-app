import 'package:bloc/bloc.dart';
import 'package:mova_app/bloc/explore/explore_state.dart';
import 'package:mova_app/models/enums/bloc_status.dart';
import 'package:mova_app/models/genres/genres_list.dart';

import '../../api/api_helper.dart';

import '../../models/movie/movie.dart';
import '../../models/movies/movies.dart';
import '../../models/regions/regions.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreState());

  getFilterDetails() {
    Future.wait([
      getRegions(),
      getGenres(),
    ]);
  }

  Future<void> getGenres() async {
    GenresList genresList = await ApiHelper.getClient().getGenresList();
    emit(
      state.copyWith(
        genresList: genresList.genres,
      ),
    );
  }

  Future<void> getRegions() async {
    List<Region> regions = await ApiHelper.getClient().getRegions();
    emit(
      state.copyWith(
        regions: regions,
      ),
    );
  }

  Future<void> searchMovies(String searchText) async {
    String parsedSearchtext = Uri.encodeComponent(searchText);
    Movies movies =
        await ApiHelper.getClient().searchMovies(parsedSearchtext, false, '');

    List<Movie> searchMovies = movies.results
        .where((e) => e.posterPath != null && e.backdropPath != null)
        .toList();

    emit(
      state.copyWith(
        movies: searchMovies,
      ),
    );
  }

  Future<void> filterMovies() async {
    emit(
      state.copyWith(status: BlocStatus.loading),
    );

    Movies filteredMovies = await ApiHelper.getClient().getDiscoverMovies(
      region: state.currentRegion,
      year: state.currentYear != null ? int.tryParse(state.currentYear) : null,
      genre: state.currentGenre,
      includeAdult: false,
    );

    List<Movie> founMovies = filteredMovies.results
        .where((e) => e.posterPath != null && e.backdropPath != null)
        .toList();

    emit(
      state.copyWith(
        movies: founMovies,
        status: BlocStatus.success,
      ),
    );
  }

  void changeFilterItems({String? region, String? genre}) {
    emit(
      state.copyWith(
        currentRegion: region,
        currentGenre: genre,
      ),
    );
    _changeSelection();
  }

  void changeYear({String? year}) {
    emit(
      state.copyWith(currentYear: year),
    );

    _changeSelection();
  }

  _changeSelection() {
    emit(
      state.copyWith(
        hasSelected: ((state.currentGenre.isNotEmpty) ||
            state.currentRegion.isNotEmpty ||
            state.currentYear.isNotEmpty),
      ),
    );
  }
}
