import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_colors.dart';
import '../texts/semibold/semibold_text_16.dart';

class DownloadButton extends StatelessWidget {
  DownloadButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(100.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/bold/download.svg',
            color: AppColors.primary,
            height: 20.h,
          ),
          const SizedBox(width: 8),
          SemiBoldText16(
            'Download',
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
