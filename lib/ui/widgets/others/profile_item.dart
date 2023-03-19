import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova_app/ui/widgets/texts/semibold/semibold_text_18.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem(
      {required this.iconPath,
      required this.title,
      this.route,
      this.trailingText,
      super.key});
  String iconPath;
  String title;
  String? route;
  String? trailingText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: GestureDetector(
        onTap: () {
          if (route != null) {
            Navigator.of(context).pushNamed(route!);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/curved/$iconPath.svg',
                  color: Theme.of(context).iconTheme.color,
                ),
                SizedBox(width: 20.w),
                SemiBoldText18(
                  title.tr(),
                ),
              ],
            ),
            Row(
              children: [
                SemiBoldText18(
                  trailingText,
                ),
                SizedBox(width: 20.w),
                SvgPicture.asset(
                  'assets/icons/light_border/arrow_right_2.svg',
                  color: Theme.of(context).iconTheme.color,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
