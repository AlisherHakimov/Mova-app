import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/ui/widgets/texts/semibold/semibold_text_16.dart';

import '../../../utils/theme_brightnes.dart';

class SocialSignInButton extends StatefulWidget {
  final String iconName;
  String? accountName;

  SocialSignInButton({required this.iconName, this.accountName, super.key});

  @override
  State<SocialSignInButton> createState() => _SocialSignInButtonState();
}

class _SocialSignInButtonState extends State<SocialSignInButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isDarkMode(context) ? AppColors.dark2 : Colors.white,
        fixedSize: Size(double.infinity, 60.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color:
                isDarkMode(context) ? AppColors.dark3 : AppColors.greyScale200,
            width: 1.w,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.accountName == null ? 10.w : 8.w,
            ),
            child: widget.iconName == 'apple'
                ? SvgPicture.asset(
                    'assets/images/apple.svg',
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                    height: 24.h,
                  )
                : Image.asset(
                    'assets/images/${widget.iconName}.png',
                    height: widget.iconName == 'facebook' ? 28.h : 24.h,
                  ),
          ),
          SemiBoldText16(
            widget.accountName == null
                ? ''
                : 'Continue with ${widget.accountName}'.tr(),
            color: isDarkMode(context)
                ? AppColors.primaryTextDark
                : AppColors.primaryTextLight,
          ),
        ],
      ),
    );
  }
}
