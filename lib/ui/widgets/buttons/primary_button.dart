import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';

import '../texts/bold/bold_text_16.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  Function() onPressed;
  Color? backgroundColor = AppColors.primary;
  Widget? child;
  PrimaryButton(
      {required this.text,
      required this.onPressed,
      this.backgroundColor,
      this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: child ??
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  child: BoldText16(
                    text.tr(),
                    color: Colors.white,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
