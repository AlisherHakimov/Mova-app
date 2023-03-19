import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova_app/bloc/sign_in/signin_cubit.dart';
import 'package:mova_app/bloc/sign_in/signin_state.dart';
import 'package:mova_app/models/enums/bloc_status.dart';
import '../../../bloc/home/home_cubit.dart';
import '../../../constants/app_colors.dart';

import '../../../constants/app_routes.dart';
import '../../widgets/buttons/back_button.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/buttons/social_sign_in_button.dart';
import '../../widgets/divider/divider.dart';
import '../../widgets/forms/input_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/texts/semibold/semibold_text_14.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
  }

  bool isRemember = true;

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  SignInCubit signInCubit = SignInCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.w,
              top: 24.h,
              right: 24.w,
              bottom: 48.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 48.h,
                  child: ArrowBackButton(),
                ),
                SizedBox(height: 24.h),
                Image.asset(
                  'assets/images/app_logo.png',
                  alignment: Alignment.center,
                  height: 180.h,
                ),
                SizedBox(height: 24.h),
                Text(
                  'Login to Your Account'.tr(),
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 40.h),
                Column(
                  children: [
                    InputForm(
                      controller: controllerUsername,
                      hintText: 'Username',
                      prefixIcon: 'bold/message',
                    ),
                    SizedBox(height: 24.h),
                    InputForm(
                      controller: controllerPassword,
                      hintText: 'Password',
                      prefixIcon: 'bold/lock',
                    ),
                    SizedBox(height: 24.h),
                    checkBox(),
                    SizedBox(height: 24.h),
                    BlocConsumer<SignInCubit, SignInState>(
                      listener: ((context, state) {
                        if (state.isLoading == BlocStatus.success) {
                          context
                              .read<HomeCubit>()
                              .getDataFromApi()
                              .then((value) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoute.tabSelector,
                              ((route) => false),
                            );
                          });
                        }
                      }),
                      bloc: signInCubit,
                      builder: (context, state) {
                        return PrimaryButton(
                          text: 'Sign In',
                          onPressed: state.isLoading == BlocStatus.loading
                              ? () {}
                              : () {
                                  signInCubit.signIn(
                                    controllerUsername.text.trim(),
                                    controllerPassword.text.trim(),
                                    context,
                                  );
                                },
                          child: state.isLoading == BlocStatus.loading
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  height: 24.h,
                                  width: 24.h,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : null,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Column(
                  children: [
                    DividerWidget('or continue with'.tr()),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialSignInButton(iconName: 'facebook'),
                        SocialSignInButton(iconName: 'google'),
                        SocialSignInButton(iconName: 'apple'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkBox() {
    return BlocBuilder<SignInCubit, SignInState>(
      bloc: signInCubit,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: state.isRemember ?? false,
                activeColor: AppColors.primary,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onChanged: (newValue) {
                  signInCubit.changeCheckBox(
                    isRemember: newValue!,
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                side: BorderSide(
                  color: AppColors.primary,
                  width: 3.w,
                ),
              ),
            ),
            SemiBoldText14(
              'Remember me'.tr(),
            ),
          ],
        );
      },
    );
  }
}
