import 'package:dio/dio.dart';
import 'package:mova_app/models/account/account_details.dart';
import 'package:mova_app/models/genres/genres_list.dart';

import 'package:mova_app/models/auth/authentication.dart';

import 'package:mova_app/models/my_list/my_list_details.dart';
import 'package:mova_app/models/new_releases/new_releases.dart';

import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../models/auth/session.dart';
import '../models/details/details.dart';
import '../models/movies/movies.dart';
import '../models/my_list/lists.dart';
import '../models/regions/regions.dart';
import '../models/videos/videos.dart';

part 'api_client.g.dart';

@RestApi(
  baseUrl: 'https://api.themoviedb.org/3/',
)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/authentication/token/new")
  Future<Authentication> createToken();

  @POST("/authentication/token/validate_with_login")
  Future<HttpResponse<Authentication>> validateWithLogin(
    @Body() Map<String, dynamic> requestBody,
    @Query("api_key") String apikey,
  );

  @POST("/authentication/session/new")
  Future<HttpResponse<Session>> createSession(
      @Body() Map<String, dynamic> requestBody);

  @GET("/movie/top_rated")
  Future<Movies> getTopMovies(
    @Query("region") String region,
  );

  @GET("/movie/upcoming")
  Future<NewReleases> getNewReleases();

  @GET("/movie/{movie_id}/similar")
  Future<Movies> getSimilarMovies(
    @Path("movie_id") int id,
  );

  @GET("/discover/movie")
  Future<Movies> getDiscoverMovies({
    @Query("region") String? region,
    @Query("year") int? year,
    @Query("with_genres") String? genre,
    @Query("include_adult") bool? includeAdult,
    @Query("include_video") bool? includeVideo,
  });

  @GET("/genre/movie/list")
  Future<GenresList> getGenresList();

  @GET("/movie/{movie_id}")
  Future<Details> getMovieDetails(
    @Path("movie_id") int id,
    @Query("append_to_response") String appendToResponse,
  );

  @GET("/configuration/countries")
  Future<List<Region>> getRegions();

  @GET("/search/movie")
  Future<Movies> searchMovies(
    @Query("query") String query,
    @Query("include_adult") bool includeAdult,
    @Query("region") String region,
    // @Query("year") int year,
  );

  @GET("/list/{list_id}")
  Future<MyListDetails> getMyListDetails(
    @Path("list_id") dynamic listId,
  );

  @GET("/movie/{movie_id}/videos")
  Future<Videos> getVideos(
    @Path("movie_id") int movieId,
  );

  @POST("/movie/{movie_id}/rating")
  Future<HttpResponse> rateMovie(
    @Path("movie_id") int movieId,
    @Body() Map<String, double> map,
    @Query("session_id") String sessionId,
  );

  @POST("/list")
  Future<HttpResponse> createList(
    @Query("session_id") String? sessionId,
    @Body() Map<String, String> map,
  );

  @POST("/list/{list_id}/add_item")
  Future<HttpResponse> addMovieToList(
    @Path("list_id") dynamic listId,
    @Query("session_id") String sessionId,
    @Body() Map<String, int> map,
  );

  @GET("/list/{list_id}/item_status")
  Future<HttpResponse> checkItemStatus(
    @Path("list_id") dynamic listId,
    @Query("movie_id") int movieId,
  );
  @GET("/account")
  Future<AccountDetails> getAccountDetails(
    @Query("session_id") String? sessionId,
  );

  @GET("/account/{account_id}/lists")
  Future<HttpResponse<Lists>> getCreatedList(
    @Path("account_id") String? accountId,
    @Query("session_id") String? sessionId,
  );
}
