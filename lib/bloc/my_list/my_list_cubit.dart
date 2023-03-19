import 'package:bloc/bloc.dart';
import 'package:mova_app/bloc/my_list/my_list_state.dart';
import 'package:mova_app/models/genres/genres_list.dart';
import 'package:mova_app/models/my_list/my_list_details.dart';
import 'package:mova_app/services/hive_service.dart';

import '../../api/api_helper.dart';
import '../../models/movie/movie.dart';

class MyListCubit extends Cubit<MyListState> {
  MyListCubit() : super(MyListState());

  getGenresList() async {
    GenresList genresList = await ApiHelper.getClient().getGenresList();
    emit(
      state.copyWith(
        genresList: genresList.genres,
      ),
    );
  }

  List<Movie>? _myListMovies;
  getMyList() async {
    int? listId = HiveService.getListId();
    if (listId != null) {
      MyListDetails myListDetails =
          await ApiHelper.getClient().getMyListDetails(listId);
      _myListMovies = myListDetails.items;
      emit(
        state.copyWith(
          myMoviesList: _myListMovies,
        ),
      );
    } else {
      emit(
        state.copyWith(
          myMoviesList: const [],
        ),
      );
    }
  }

  void sortByGenre(int? currentGenreId) {
    if (currentGenreId != null) {
      List<Movie>? sortMovies = _myListMovies
          ?.where((element) => element.genreIds.contains(currentGenreId))
          .toList();

      emit(
        state.copyWith(
          currentGenreId: currentGenreId,
          myMoviesList: sortMovies,
        ),
      );
    } else {
      emit(
        state.copyWith(
          currentGenreId: null,
          myMoviesList: _myListMovies,
        ),
      );
    }
  }
}
