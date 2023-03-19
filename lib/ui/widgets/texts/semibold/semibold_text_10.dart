import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/utils/theme_brightnes.dart';

class SemiBoldText10 extends StatelessWidget {
  SemiBoldText10(this.text,
      {this.color, this.overflow, this.letterSpacing, super.key});
  String? text;
  Color? color;
  double? letterSpacing;
  TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: 2,
      overflow: overflow,
      style: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacing ?? 1.4,
        color: color ??
            (isDarkMode(context)
                ? AppColors.primaryTextDark
                : AppColors.primaryTextLight),
      ),
    );
  }
}
