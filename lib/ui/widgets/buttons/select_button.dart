import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/ui/widgets/texts/semibold/semibold_text_16.dart';

class SelectButton extends StatelessWidget {
  SelectButton(
      {required this.text,
      required this.isSelected,
      required this.onTap,
      super.key});
  String text;
  bool isSelected;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    context.fallbackLocale;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary
                : Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(400.r),
            border: Border.all(color: AppColors.primary, width: 2.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: SemiBoldText16(
            text.tr(),
            color: isSelected ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
