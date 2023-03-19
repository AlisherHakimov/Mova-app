import 'package:bloc/bloc.dart';

import 'package:mova_app/bloc/home/home_state.dart';
import 'package:mova_app/models/genres/genres_list.dart';
import 'package:mova_app/models/new_releases/new_releases.dart';
import '../../api/api_helper.dart';
import '../../models/movies/movies.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<bool> getDataFromApi() async {
    Future.wait([
      getGenresList(),
      getTopMovies(),
      getNewReleases(),
    ]);
    return true;
  }

  Future<void> getTopMovies() async {
    Movies topMovies = await ApiHelper.getClient().getTopMovies('');
    emit(
      state.copyWith(
        topMoviesList: topMovies.results,
      ),
    );
  }

  Future<void> getNewReleases() async {
    NewReleases newReleases = await ApiHelper.getClient().getNewReleases();
    emit(
      state.copyWith(
        newReleasesList: newReleases.results,
      ),
    );
  }

  Future<void> getGenresList() async {
    GenresList genresList = await ApiHelper.getClient().getGenresList();
    emit(
      state.copyWith(
        genresList: genresList.genres,
      ),
    );
  }
}
