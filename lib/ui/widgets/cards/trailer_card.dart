import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/models/videos/video.dart';

import '../../../utils/theme_brightnes.dart';
import '../../pages/video_player/video_player_page.dart';

class TrailerCard extends StatelessWidget {
  TrailerCard(
    this.currentVideo, {
    super.key,
  });
  Video currentVideo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerPage(youtubeKey: currentVideo.key),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 113.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.w,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      'https://img.youtube.com/vi/${currentVideo.key}/default.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            SizedBox(
              width: 210.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentVideo.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    currentVideo.publishedAt.substring(0, 10),
                    style: TextStyle(
                      color: isDarkMode(context)
                          ? AppColors.greyScale300
                          : AppColors.greyScale700,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
