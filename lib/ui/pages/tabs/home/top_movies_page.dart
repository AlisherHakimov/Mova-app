import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/ui/widgets/buttons/back_button.dart';
import 'package:mova_app/ui/widgets/cards/movie_card.dart';

import '../../../../models/movie/movie.dart';

class TopMoviesPage extends StatelessWidget {
  TopMoviesPage(this.topMoviesList, {super.key});

  List<Movie> topMoviesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Row(
                children: [
                  ArrowBackButton(),
                  Text(
                    'Top 10 Movies This week'.tr(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: 0.75,
              ),
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, bottom: 24.h, top: 12.h),
              itemCount: topMoviesList.length,
              itemBuilder: ((context, index) {
                return MovieCard(topMoviesList[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
