import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/api_constants.dart';
import 'package:mova_app/models/credits/cast.dart';
import 'package:mova_app/ui/widgets/texts/semibold/semibold_text_10.dart';

class PersonCard extends StatelessWidget {
  PersonCard({required this.cast, super.key});
  Cast cast;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage(ApiConstants.posterBaseUrl + cast.profilePath!),
          ),
          SizedBox(width: 12.w),
          SizedBox(
            width: 64.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SemiBoldText10(
                  cast.name,
                  color: Theme.of(context).iconTheme.color,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Cast',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
