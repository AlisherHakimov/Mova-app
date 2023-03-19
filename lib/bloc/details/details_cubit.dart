import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mova_app/api/api_helper.dart';
import 'package:mova_app/bloc/details/details_state.dart';
import 'package:mova_app/models/details/details.dart';

import 'package:mova_app/services/hive_service.dart';
import 'package:retrofit/dio.dart';

import '../../models/credits/cast.dart';
import '../../models/genres/genres_list.dart';
import '../../models/movie/movie.dart';
import '../../models/movies/movies.dart';
import '../../models/videos/video.dart';
import '../../models/videos/videos.dart';
import '../../ui/widgets/snacbars/custom_snacbar.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsState());

  final String _sessionId = HiveService.getSessionId()!;
  final int _listId = HiveService.getListId();

  Future<bool> getMovieDetails(int movieId) async {
    Details movieDetails = await ApiHelper.getClient().getMovieDetails(
      movieId,
      'credits',
    );

    GenresList genresList = await ApiHelper.getClient().getGenresList();

    Videos videos = await ApiHelper.getClient().getVideos(movieId);
    List<Video> trailers = videos.results
      ..where((video) => (video.type == 'Trailer' && video.site == 'YouTube'));

    List<Cast> personsList =
        movieDetails.credits.cast.where((e) => e.profilePath != null).toList();

    emit(
      state.copyWith(
          movieDetails: movieDetails,
          genresList: genresList.genres,
          personsList: personsList,
          trailers: trailers),
    );

    return true;
  }

  Future<void> getSimilarMovies(int movieId) async {
    Movies similarMovies = await ApiHelper.getClient().getSimilarMovies(
      movieId,
    );
    List<Movie> similarMoviesList = similarMovies.results
        .where((e) => e.posterPath != null && e.backdropPath != null)
        .toList();

    emit(
      state.copyWith(similarMovies: similarMoviesList),
    );
  }

  Future<void> rateMovie(
      int movieId, double value, BuildContext context) async {
    Map<String, double> rateMap = {'value': value};
    HttpResponse? ratingResponse;
    try {
      ratingResponse =
          await ApiHelper.getClient().rateMovie(movieId, rateMap, _sessionId);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        // ignore: use_build_context_synchronously
        customSnacBar(
          context,
          message: 'Rated successfully',
          title: 'Success',
          contentType: ContentType.success,
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        // ignore: use_build_context_synchronously
        customSnacBar(
          context,
          message: ratingResponse?.response.statusMessage as String,
          title: 'Failed',
          contentType: ContentType.help,
        ),
      );
    }
  }

  Future<void> addMovieToList(int mediaId, BuildContext context) async {
    Map<String, int> bodyMap = {"media_id": mediaId};
    try {
      final addMovie = await ApiHelper.getClient()
          .addMovieToList(_listId, _sessionId, bodyMap);
      if (addMovie.response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          // ignore: use_build_context_synchronously
          customSnacBar(
            context,
            message: addMovie.response.statusMessage!,
            title: '',
            contentType: ContentType.success,
          ),
        );
      }
    } on Exception catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        customSnacBar(
          context,
          message: "The movie is already added to list",
          title: 'Warning',
          contentType: ContentType.warning,
        ),
      );
    }
  }
}
