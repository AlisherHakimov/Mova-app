import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/utils/theme_brightnes.dart';

class MediumText18 extends StatelessWidget {
  MediumText18(this.text,
      {this.color,
      this.letterSpacing,
      this.textAlign,
      this.overflow,
      this.maxLines,
      super.key});
  String? text;
  Color? color;
  double? letterSpacing;
  TextOverflow? overflow;
  TextAlign? textAlign;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: letterSpacing ?? 1.4,
        color: color ??
            (isDarkMode(context)
                ? AppColors.primaryTextDark
                : AppColors.primaryTextLight),
      ),
    );
  }
}
