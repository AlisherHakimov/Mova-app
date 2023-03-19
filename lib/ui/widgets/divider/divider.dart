import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';

import '../../../utils/theme_brightnes.dart';

class DividerWidget extends StatelessWidget {
  DividerWidget(this.text, {super.key});

  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              indent: 8,
              endIndent: 10,
              thickness: 2.5.h,
            ),
          ),
          Text(
            text.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color:
                  isDarkMode(context) ? Colors.white : AppColors.greyScale700,
              letterSpacing: 1.4,
            ),
          ),
          Expanded(
            child: Divider(
              indent: 10.w,
              endIndent: 8.w,
              thickness: 2.5.h,
            ),
          ),
        ],
      ),
    );
  }
}
