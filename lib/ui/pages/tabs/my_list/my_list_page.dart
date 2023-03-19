import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/bloc/my_list/my_list_cubit.dart';
import 'package:mova_app/services/hive_service.dart';
import 'package:mova_app/utils/theme_brightnes.dart';

import '../../../../bloc/my_list/my_list_state.dart';
import '../../../../models/genres/genre.dart';
import '../../../../models/movie/movie.dart';
import '../../../widgets/buttons/select_button.dart';
import '../../../widgets/cards/movie_card.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  int? listId;
  @override
  void initState() {
    listId = HiveService.getListId();
    context.read<MyListCubit>().getGenresList();
    context.read<MyListCubit>().getMyList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: listId == null
          ? emptyList(context)
          : Column(children: [
              genresListView(),
              SizedBox(height: 12.h),
              moviesGridView(),
            ]),
    );
  }

  Container genresListView() {
    return Container(
      padding: const EdgeInsets.only(),
      height: 48.h,
      child: BlocBuilder<MyListCubit, MyListState>(
        builder: (context, state) {
          List<Genre> genresList = state.genresList;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genresList.length,
            itemBuilder: (context, index) {
              int? currentGenreId = index == 0 ? null : genresList[index].id;
              bool isSelected = state.currentGenreId == currentGenreId;

              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24.w : 0,
                  right: index == genresList.length - 1 ? 24.w : 12.w,
                ),
                child: SelectButton(
                  text: index == 0
                      ? 'All Categories'.tr()
                      : genresList[index].name,
                  isSelected: isSelected,
                  onTap: (() {
                    context.read<MyListCubit>().sortByGenre(currentGenreId);
                  }),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Flexible moviesGridView() {
    return Flexible(
      child: BlocBuilder<MyListCubit, MyListState>(
        builder: (context, state) {
          List<Movie> myList = state.myMoviesList;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 0.75,
            ),
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, top: 24.h, bottom: 72.h),
            itemCount: myList.length,
            itemBuilder: ((context, index) {
              return MovieCard(myList[index]);
            }),
          );
        },
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 76.h,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  height: 32.h,
                ),
                SizedBox(width: 16.w),
                Text(
                  'My List'.tr(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Center emptyList(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 140.h),
          Image.asset(
            'assets/images/empty_list_${isDarkMode(context) ? 'dark' : 'light'}.png',
            height: 220.h,
          ),
          SizedBox(height: 44.h),
          Text(
            'Your List is Empty'.tr(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
