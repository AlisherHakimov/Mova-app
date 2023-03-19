import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchButton extends StatelessWidget {
  SearchButton({required this.onPressed, super.key});
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        'assets/icons/light_border/search.svg',
        color: Theme.of(context).iconTheme.color,
        height: 28.h,
      ),
    );
  }
}
