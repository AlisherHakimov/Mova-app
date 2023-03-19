import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/bloc/explore/explore_cubit.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/ui/widgets/forms/input_form.dart';

import '../../../../bloc/explore/explore_state.dart';
import '../../../../models/movie/movie.dart';
import '../../../../utils/theme_brightnes.dart';
import '../../../widgets/bottom_sheets/filter_btm_sheet.dart';
import '../../../widgets/cards/movie_card.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context.read<ExploreCubit>().getFilterDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(context),
      body: serchBody(),
    );
  }

  Widget serchBody() {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state.movies.isEmpty) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 140.h),
                  Image.asset(
                    'assets/images/not_found_${isDarkMode(context) ? 'dark' : 'light'}.png',
                    height: 200,
                  ),
                  SizedBox(height: 44.h),
                  Text(
                    'Not Found'.tr(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 16.h),
                  const Text('')
                ],
              ),
            ),
          );
        } else {
          List<Movie> movies = state.movies;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 0.75,
            ),
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, top: 12.h, bottom: 76.h),
            itemCount: movies.length,
            itemBuilder: ((context, index) {
              return MovieCard(movies[index]);
            }),
          );
        }
      },
    );
  }

  AppBar searchAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 108.h,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InputForm(
                onChanged: ((text) {
                  context.read<ExploreCubit>().searchMovies(text);
                }),
                controller: searchController,
                hintText: 'Search',
                prefixIcon: 'light_border/search',
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                onPressed: (() {
                  showFilterBottomSheet(context);
                }),
                icon: Image.asset(
                  'assets/icons/bold/filter.png',
                  height: 28.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showFilterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
        side: BorderSide(
          width: 1.h,
          color: AppColors.dark3,
          strokeAlign: StrokeAlign.outside,
        ),
      ),
      builder: ((context) {
        return FilterBottomSheet();
      }),
    );
  }
}
