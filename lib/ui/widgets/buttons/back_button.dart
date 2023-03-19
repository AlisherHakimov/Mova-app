import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowBackButton extends StatelessWidget {
  ArrowBackButton({this.color, super.key});
  Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset('assets/icons/light_outlined/arrow_left.svg',
          color: color ?? Theme.of(context).iconTheme.color),
    );
  }
}
