import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova_app/bloc/details/details_cubit.dart';
import 'package:mova_app/bloc/details/details_state.dart';
import 'package:mova_app/constants/api_constants.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/models/movie/movie.dart';
import 'package:mova_app/providers/message_provider.dart';

import 'package:mova_app/ui/widgets/buttons/back_button.dart';
import 'package:mova_app/ui/widgets/cards/person_card.dart';
import 'package:mova_app/ui/widgets/cards/trailer_card.dart';
import 'package:mova_app/ui/widgets/texts/semibold/semibold_text_14.dart';
import 'package:mova_app/utils/theme_brightnes.dart';
import 'package:share_plus/share_plus.dart';

import '../../../models/comment/chat_message.dart';
import '../../../models/details/details.dart';
import '../../../models/videos/video.dart';
import '../../widgets/progress_indicator.dart';
import '../../widgets/bottom_sheets/rating_btm_sheet.dart';
import '../../widgets/cards/message_card.dart';
import '../../widgets/cards/movie_card.dart';
import '../../widgets/texts/medium/medium_text_12.dart';
import '../../widgets/texts/semibold/semibold_text_10.dart';
import '../../widgets/texts/semibold/semibold_text_12.dart';
import 'all_comments_page.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage(this.movieId, {super.key});
  int movieId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TabController? tabController;
  DetailsCubit detailsCubit = DetailsCubit();
  @override
  void initState() {
    context.read<DetailsCubit>().getMovieDetails(widget.movieId);
    context.read<DetailsCubit>().getSimilarMovies(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: detailsCubit.getMovieDetails(widget.movieId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CustomProgressIndicator();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  detailsTop(),
                  movieElements(context),
                  personsList(),
                  tabControllerView(context),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  DefaultTabController tabControllerView(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: TabBar(
              splashFactory: NoSplash.splashFactory,
              splashBorderRadius: BorderRadius.circular(16.r),
              isScrollable: true,
              indicatorColor: AppColors.primary,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.greyScale700,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.4,
              ),
              tabs: [
                Tab(text: 'Trailers'.tr()),
                Tab(text: 'More Like This'.tr()),
                Tab(text: 'Comments'.tr()),
              ],
            ),
          ),
          SizedBox(
            height: 820.h,
            child: TabBarView(
              children: [
                trailersListView(),
                moreLikeThis(),
                commentsListView(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget commentsListView(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: ChatMessageProvider.getChatMessage(widget.movieId.toString()),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data?.docs ?? [];
          int? messagesCount = items.length;
          if (items.isEmpty) {
            return noMessageWidget(context);
          }
          return SizedBox(
            height: 792.h,
            child: Flexible(
              child: Wrap(
                children: [
                  commentTitle(context, messagesCount: messagesCount),
                  messagesListView(items),
                ],
              ),
            ),
          );
        } else {
          return noMessageWidget(context);
        }
      },
    );
  }

  SizedBox noMessageWidget(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Expanded(
        child: Column(
          children: [
            commentTitle(context),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 32.h),
              child: const Center(child: Text('No messages yet !')),
            ),
          ],
        ),
      ),
    );
  }

  Padding commentTitle(BuildContext context, {int? messagesCount}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${messagesCount ?? 'No'} Comments',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllCommentsPage(widget.movieId)),
              );
            }),
            child: SemiBoldText14(
              'See All',
              color: AppColors.primary,
            ),
          )
        ],
      ),
    );
  }

  ListView messagesListView(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> items) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
      itemCount: items.length < 10 ? items.length : 10,
      itemBuilder: ((context, index) {
        final itemJson = items[index].data();
        final chatMessage = ChatMessage.fromJson(itemJson);
        return MessageCard(
          chatRoomId: widget.movieId.toString(),
          chatMessage: chatMessage,
        );
      }),
    );
  }

  Widget moreLikeThis() {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        List<Movie> moviesList = state.similarMovies;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 0.75,
          ),
          padding: EdgeInsets.only(bottom: 12.h, left: 24.w, right: 24.w),
          itemCount: moviesList.length,
          itemBuilder: ((context, index) {
            return MovieCard(moviesList[index]);
          }),
        );
      },
    );
  }

  Widget trailersListView() {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        List<Video> videos = state.trailers;

        if (videos.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: const Text(
              'Not Videos',
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          itemCount: videos.length,
          itemBuilder: ((context, index) {
            Video currentVideo = videos[index];

            return TrailerCard(
              currentVideo,
            );
          }),
        );
      },
    );
  }

  SizedBox personsList() {
    return SizedBox(
      height: 56.h,
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          final personsList = state.personsList;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: personsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 24.w : 0,
                  right: index == 6 - 1 ? 24.w : 12.w,
                ),
                child: PersonCard(cast: personsList[index]),
              );
            },
          );
        },
      ),
    );
  }

  Padding movieElements(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        left: 24.w,
        right: 24.w,
        bottom: 20.h,
      ),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          Details? movieDetails = state.movieDetails;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      movieDetails == null ? '' : movieDetails.title,
                      style: Theme.of(context).textTheme.headline4,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context
                          .read<DetailsCubit>()
                          .addMovieToList(widget.movieId, context);
                    },
                    splashRadius: 30.r,
                    icon: SvgPicture.asset(
                      'assets/icons/curved/bookmark.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Share.share(
                        'https://www.themoviedb.org/movie/${movieDetails?.id}',
                      );
                    },
                    splashRadius: 30.r,
                    icon: SvgPicture.asset(
                      'assets/icons/curved/send.svg',
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
              Row(children: [
                Image.asset('assets/icons/bulk/star.png'),
                SizedBox(width: 8.w),
                SemiBoldText12(
                  '${state.movieDetails?.voteAverage}'.substring(0, 3),
                  color: AppColors.primary,
                ),
                IconButton(
                  onPressed: () {
                    showRatingBtmSheet(context, state.movieDetails!.id);
                  },
                  splashRadius: 20.r,
                  icon: SvgPicture.asset(
                    'assets/icons/curved/arrow_right_2.svg',
                    color: AppColors.primary,
                  ),
                ),
                SemiBoldText14(
                  '${state.movieDetails?.releaseDate.substring(0, 4)}',
                  color: isDarkMode(context)
                      ? AppColors.greyScale300
                      : AppColors.greyScale800,
                ),
                SizedBox(width: 12.w),
                // SizedBox(width: 12.w),
                elementsWidget(
                  state.movieDetails?.originalLanguage.toUpperCase() ?? '',
                ),
                SizedBox(width: 12.w),
                elementsWidget(
                  '${state.movieDetails?.budget.toString()} y.e',
                ),
              ]),
              SizedBox(height: 20.h),
              MediumText12(
                '${'Genre'.tr()}: ${state.genresList.map(
                  (e) {
                    for (int i = 0; i < state.genresList.length; i++) {
                      if (state.genresList[i].id == e.id) {
                        return state.genresList[i].name;
                      }
                    }
                  },
                )}',
                overflow: TextOverflow.ellipsis,
                color: Theme.of(context).iconTheme.color,
              ),
              SizedBox(height: 8.h),
              textSpan(context),
            ],
          );
        },
      ),
    );
  }

  Widget textSpan(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return RichText(
          maxLines: 3,
          text: TextSpan(
            text: state.movieDetails?.overview,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: isDarkMode(context)
                  ? AppColors.greyScale300
                  : AppColors.greyScale800,
            ),
          ),
        );
      },
    );
  }

  SizedBox detailsTop() {
    return SizedBox(
      height: 320.h,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              if (state.movieDetails == null) {
                return const CustomProgressIndicator();
              }

              return Image.network(
                ApiConstants.backdropBaseUrl +
                    state.movieDetails!.backdropPath!,
                fit: BoxFit.cover,
              );
            },
          ),
          Column(
            children: [
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 16.w),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ArrowBackButton(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container elementsWidget(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.6.h,
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: SemiBoldText10(
        text,
        overflow: TextOverflow.ellipsis,
        color: AppColors.primary,
        letterSpacing: 1.2,
      ),
    );
  }

  Future<dynamic> showRatingBtmSheet(BuildContext context, int id) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: AppColors.dark2,
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
        return RatingBtmSheet(id);
      }),
    );
  }
}
