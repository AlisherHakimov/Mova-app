import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/ui/pages/details/details_page.dart';
import 'package:mova_app/ui/widgets/texts/semibold/semibold_text_10.dart';
import 'package:mova_app/utils/theme_brightnes.dart';
import '../../../constants/api_constants.dart';
import '../../../models/movie/movie.dart';

class MovieCard extends StatelessWidget {
  MovieCard(this.currentMovie, {super.key});
  Movie currentMovie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(currentMovie.id),
          ),
        );
      }),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode(context) ? AppColors.dark2 : AppColors.greyScale300,
          borderRadius: BorderRadius.circular(12.r),
        ),
        height: 200.h,
        width: 150.w,
        child: Stack(
          alignment: Alignment.topLeft,
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: currentMovie.backdropPath != null
                  ? Image.network(
                      ApiConstants.backdropBaseUrl + currentMovie.backdropPath!,
                      height: 200.h,
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Text('No image')),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  height: 24.h,
                  width: 34.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: SemiBoldText10(
                      currentMovie.voteAverage.toString().substring(0, 3),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
