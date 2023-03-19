import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova_app/bloc/home/home_cubit.dart';
import 'package:mova_app/constants/app_routes.dart';
import 'package:mova_app/ui/pages/tabs/home/new_releases_page.dart';
import 'package:mova_app/ui/pages/tabs/home/top_movies_page.dart';

import '../../../../bloc/details/details_cubit.dart';
import '../../../../bloc/home/home_state.dart';
import '../../../../constants/api_constants.dart';
import '../../../../constants/app_colors.dart';
import '../../../../models/movie/movie.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../../utils/theme_data_provider.dart';
import '../../../widgets/cards/movie_card.dart';
import '../../../widgets/texts/semibold/semibold_text_12.dart';
import '../../../widgets/texts/semibold/semibold_text_14.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Movie> topMoviesList;
  late List<Movie> newReleasesList;
  late Movie currentMovie;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            movieHomeTop(context),
            topMoviesTitle(context),
            topMoviesListWidget(),
            newReleasesTitle(context),
            newReleasesListWidget(),
            SizedBox(height: 92.h),
          ],
        ),
      ),
    );
  }

  Padding newReleasesTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'New Releases'.tr(),
            style: Theme.of(context).textTheme.headline5,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewReleasesPage(newReleasesList)),
              );
            },
            child: SemiBoldText14(
              'See all'.tr(),
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Padding topMoviesTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'Top 10 Movies This Week'.tr(),
              maxLines: 2,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TopMoviesPage(topMoviesList)),
              );
            },
            child: SemiBoldText14(
              'See all'.tr(),
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget movieHomeTop(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.newReleasesList.isEmpty) {
            return const CustomProgressIndicator();
          }
          newReleasesList = state.newReleasesList;
          Movie? lastMovie = newReleasesList[1];
          currentMovie = lastMovie;
          List<String?> movieGenres = lastMovie.genreIds.map((e) {
            for (int i = 0; i < state.genresList.length; i++) {
              if (state.genresList[i].id == e) {
                return state.genresList[i].name;
              }
            }
          }).toList();
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                lastMovie.backdropPath != null
                    ? (ApiConstants.backdropBaseUrl + lastMovie.backdropPath!)
                    : ApiConstants.posterBaseUrl + lastMovie.posterPath!,
                fit: BoxFit.cover,
              ),
              SafeArea(
                bottom: false,
                child: Container(
                  margin: EdgeInsets.all(24.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/app_logo.png',
                            height: 32.h,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoute.explore);
                                },
                                icon: SvgPicture.asset(
                                  'assets/icons/light_border/search.svg',
                                  height: 28.h,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lastMovie.title,
                            style: ThemeProvider.darkTheme.textTheme.headline4,
                          ),
                          SizedBox(height: 8.h),
                          SemiBoldText12(
                            '${movieGenres.map(
                              (e) => e,
                            )}',
                            color: Colors.white,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              // PlayButton(
                              //   onPressed: (() {}),
                              // ),
                              // SizedBox(width: 12.w),
                              myListButton(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox topMoviesListWidget() {
    return SizedBox(
      height: 200.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.topMoviesList.isEmpty) {
            return const CustomProgressIndicator();
          }
          topMoviesList = state.topMoviesList;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topMoviesList.length > 10 ? 10 : topMoviesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24.w : 8.w,
                  right: index == 9 ? 24.w : 0.w,
                ),
                child: MovieCard(topMoviesList[index]),
              );
            },
          );
        },
      ),
    );
  }

  SizedBox newReleasesListWidget() {
    return SizedBox(
      height: 200,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.topMoviesList.isEmpty) {
            return const CustomProgressIndicator();
          }
          newReleasesList = state.newReleasesList;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                newReleasesList.length > 10 ? 10 : newReleasesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24.w : 8.w,
                  right: index == 9 ? 24.w : 0,
                ),
                child: MovieCard(newReleasesList[index]),
              );
            },
          );
        },
      ),
    );
  }

  Widget myListButton() {
    return ElevatedButton(
      onPressed: (() {
        context.read<DetailsCubit>().addMovieToList(currentMovie.id, context);
      }),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.add,
            size: 16.h,
          ),
          SizedBox(width: 8.w),
          SemiBoldText14(
            'My List'.tr(),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
