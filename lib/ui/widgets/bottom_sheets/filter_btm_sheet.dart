import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/explore/explore_cubit.dart';
import '../../../bloc/explore/explore_state.dart';
import '../../../constants/app_colors.dart';
import '../../../models/genres/genre.dart';
import '../../../models/regions/regions.dart';
import '../buttons/primary_button.dart';
import '../buttons/select_button.dart';

class FilterBottomSheet extends StatelessWidget {
  List<dynamic> periodsList = [
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 660.h,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.h),
            color: AppColors.dark3,
            height: 3.h,
            width: 38.w,
          ),
          SizedBox(height: 24.h),
          Text(
            'Sort & Filter'.tr(),
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 24.h),
          Divider(
            endIndent: 24.w,
            indent: 24.w,
            color: AppColors.dark3,
            thickness: 1.h,
          ),
          itemsTitle(context, 'Regions'),
          regionsListView(),
          itemsTitle(context, 'Genre'),
          genresListView(),
          itemsTitle(context, 'Time/period'),
          periodsListView(),
          SizedBox(height: 24.h),
          Divider(
            endIndent: 24.w,
            indent: 24.w,
            color: AppColors.dark3,
            thickness: 1.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                          text: 'Reset',
                          backgroundColor: state.hasSelected
                              ? AppColors.primary
                              : AppColors.dark3,
                          onPressed: state.hasSelected
                              ? () {
                                  context
                                      .read<ExploreCubit>()
                                      .changeFilterItems(
                                        region: '',
                                        genre: '',
                                      );
                                  context
                                      .read<ExploreCubit>()
                                      .changeYear(year: '');
                                }
                              : () {}),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: PrimaryButton(
                        text: 'Apply',
                        backgroundColor: state.hasSelected
                            ? AppColors.primary
                            : AppColors.dark3,
                        onPressed: state.hasSelected
                            ? () {
                                context
                                    .read<ExploreCubit>()
                                    .filterMovies()
                                    .then((value) {
                                  Navigator.pop(context);
                                });
                              }
                            : () {},
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget itemsTitle(BuildContext context, String title) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Text(
        title.tr(),
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget genresListView() {
    return SizedBox(
      height: 48.h,
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          List<Genre> genresList = state.genresList;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genresList.length,
            itemBuilder: (context, index) {
              String currentGenre = genresList[index].name;
              bool isSelected = state.currentGenre == currentGenre;

              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24.w : 0,
                  right: index == genresList.length - 1 ? 24.w : 12.w,
                ),
                child: SelectButton(
                  text: currentGenre,
                  isSelected: isSelected,
                  onTap: (() {
                    context
                        .read<ExploreCubit>()
                        .changeFilterItems(genre: currentGenre);
                  }),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget regionsListView() {
    return SizedBox(
      height: 48.h,
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          List<Region> regions = state.regions;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: regions.length,
            itemBuilder: (context, index) {
              String regionCode = regions[index].countryCode;
              String regionName = regions[index].name;

              bool isSelected = state.currentRegion == regionCode;
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24.w : 0,
                  right: index == regions.length - 1 ? 24.w : 12.w,
                ),
                child: SelectButton(
                  text: regionName,
                  isSelected: isSelected,
                  onTap: (() {
                    context
                        .read<ExploreCubit>()
                        .changeFilterItems(region: regionCode);
                  }),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget periodsListView() {
    return SizedBox(
      height: 48.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: periodsList.length,
        itemBuilder: (context, index) {
          String periodYear = periodsList[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24.w : 0,
              right: index == periodsList.length - 1 ? 24.w : 12.w,
            ),
            child: BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                bool isSelected = state.currentYear == periodYear;

                return SelectButton(
                  text: periodsList[index],
                  isSelected: isSelected,
                  onTap: (() {
                    context.read<ExploreCubit>().changeYear(year: periodYear);
                  }),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
