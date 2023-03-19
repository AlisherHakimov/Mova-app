import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mova_app/constants/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/services/hive_service.dart';

import '../../../bloc/home/home_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    autoNavigation();
    super.initState();
  }

  void autoNavigation() async {
    String? sessionId = HiveService.getSessionId();

    if (sessionId == null) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoute.visit, (route) => false),
      );
    } else {
      Future.delayed(const Duration(seconds: 2)).then(
        ((value) {
          context.read<HomeCubit>().getDataFromApi().then(
                (value) => Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoute.tabSelector,
                  ((route) => false),
                ),
              );
        }),
      );
    }
  }

  Color? spinColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 60.h),
            Image.asset(
              'assets/images/app_logo.png',
              alignment: Alignment.center,
              height: 160.h,
            ),
            SpinKitCircle(
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFE21221),
                    shape: BoxShape.circle,
                  ),
                );
              },
              color: spinColor,
              size: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}
