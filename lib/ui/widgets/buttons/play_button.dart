import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayButton extends StatelessWidget {
  PlayButton(
      {required this.onPressed, this.iconSize, this.fontSize, super.key});

  double? iconSize = 16;
  double? fontSize = 14;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/bold/play.png',
              height: iconSize,
            ),
            SizedBox(width: 8.w),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Play',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize?.sp,
                  letterSpacing: 1.4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
