import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mova_app/ui/widgets/buttons/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/ui/widgets/texts/bold/bold_text_40.dart';
import 'package:mova_app/ui/widgets/texts/medium/medium_text_18.dart';

import '../../../constants/app_routes.dart';

// ignore: must_be_immutable
class VisitPage extends StatelessWidget {
  VisitPage({Key? key}) : super(key: key);

  PageController controller = PageController();
  int activeScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg_image.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 36,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BoldText40(
                  'Welcome to Mova'.tr(),
                  textAlign: TextAlign.center,
                  color: Colors.white,
                ),
                SizedBox(height: 24.h),
                MediumText18(
                  'The best movie streaming app of the century to make your days great!'
                      .tr(),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
                SizedBox(height: 24.h),
                // SmoothPageIndicator(
                //   controller: controller,
                //   count: 3,
                //   effect: const ExpandingDotsEffect(
                //     dotColor: Colors.white,
                //     activeDotColor: AppColors.primary,
                //     dotHeight: 8,
                //     dotWidth: 8,
                //     radius: 8,
                //     expansionFactor: 4,
                //   ),
                // ),
                SizedBox(height: 48.h),
                PrimaryButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoute.signIn);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
