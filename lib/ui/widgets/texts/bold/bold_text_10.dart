import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/utils/theme_brightnes.dart';

class BoldText10 extends StatelessWidget {
  BoldText10(this.text, {this.color, this.letterSpacing, super.key});
  String? text;
  Color? color;
  double? letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontSize: 10.sp,
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
