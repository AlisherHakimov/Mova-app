import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/movie/movie.dart';
import '../../../widgets/buttons/back_button.dart';
import '../../../widgets/cards/movie_card.dart';

class NewReleasesPage extends StatelessWidget {
  NewReleasesPage(this.newReleasesList, {super.key});

  List<Movie> newReleasesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ArrowBackButton(),
                      Text(
                        'New Releases'.tr(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
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
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              itemCount: newReleasesList.length,
              itemBuilder: ((context, index) {
                return MovieCard(newReleasesList[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
