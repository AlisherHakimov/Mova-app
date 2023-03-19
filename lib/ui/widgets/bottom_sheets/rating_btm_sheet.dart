import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/ui/widgets/buttons/primary_button.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../bloc/details/details_cubit.dart';
import '../../../bloc/details/details_state.dart';
import '../../../constants/app_colors.dart';
import '../../../models/details/details.dart';

class RatingBtmSheet extends StatefulWidget {
  RatingBtmSheet(
    this.id, {
    Key? key,
  }) : super(key: key);
  int id;
  @override
  State<RatingBtmSheet> createState() => _RatingBtmSheetState();
}

class _RatingBtmSheetState extends State<RatingBtmSheet> {
  double ratingValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      height: 280,
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          Details movieDetails = state.movieDetails!;
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h),
                color: AppColors.dark3,
                height: 3.h,
                width: 38.w,
              ),
              SizedBox(height: 24.h),
              Text(
                'Give Rating'.tr(),
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 24.h),
              Divider(
                color: AppColors.dark3,
                thickness: 1.h,
              ),
              SizedBox(height: 24.h),
              SmoothStarRating(
                allowHalfRating: false,
                onRatingChanged: (v) {
                  ratingValue = v;
                  setState(() {});
                },
                starCount: 5,
                rating: ratingValue,
                size: 40.0,
                filledIconData: Icons.star,
                color: AppColors.primary,
                borderColor: AppColors.primary,
                spacing: 0.0,
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: 'Cancel'.tr(),
                      backgroundColor: AppColors.dark3,
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: PrimaryButton(
                      text: 'Submit'.tr(),
                      backgroundColor: ratingValue == 0
                          ? AppColors.dark3
                          : AppColors.primary,
                      onPressed: ratingValue == null
                          ? () {}
                          : () {
                              context
                                  .read<DetailsCubit>()
                                  .rateMovie(widget.id, ratingValue, context);
                            },
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
