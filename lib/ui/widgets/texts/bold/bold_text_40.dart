import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/utils/theme_brightnes.dart';

class BoldText40 extends StatelessWidget {
  BoldText40(this.text,
      {this.color, this.letterSpacing, this.textAlign, super.key});
  String? text;
  Color? color;
  double? letterSpacing;
  TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: letterSpacing ?? 1.4,
        color: color ??
            (isDarkMode(context)
                ? AppColors.primaryTextDark
                : AppColors.primaryTextLight),
      ),
    );
  }
}
