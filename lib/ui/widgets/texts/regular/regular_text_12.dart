import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/utils/theme_brightnes.dart';

class RegularText12 extends StatelessWidget {
  RegularText12(this.text,
      {this.color,
      this.letterSpacing,
      this.textAlign,
      this.textDirection,
      this.overflow,
      this.maxLines,
      super.key});
  String? text;
  Color? color;
  double? letterSpacing;
  TextOverflow? overflow;
  TextAlign? textAlign;
  TextDirection? textDirection;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacing ?? 1.4,
        color: color ??
            (isDarkMode(context)
                ? AppColors.primaryTextDark
                : AppColors.primaryTextLight),
      ),
    );
  }
}
