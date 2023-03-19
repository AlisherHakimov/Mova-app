import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/constants/app_routes.dart';
import 'package:mova_app/ui/widgets/others/profile_item.dart';

import '../../../../bloc/settings/settings_cubit.dart';
import '../../../../bloc/settings/settings_state.dart';
import '../../../../services/hive_service.dart';
import '../../../../utils/theme_brightnes.dart';
import '../../../widgets/texts/semibold/semibold_text_18.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String username;
  late String? profilePath;
  @override
  void initState() {
    final userInfo = HiveService.getAccountDetails().entries.toList();
    username = userInfo[1].value;
    profilePath = userInfo[2].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/app_logo.png',
                    height: 32.h,
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Profile'.tr(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(400.r),
                child: profilePath == null
                    ? Image.asset(
                        'assets/images/avatar_${isDarkMode(context) ? 'dark' : 'light'}.png')
                    : Image.network(
                        'https://image.tmdb.org/t/p/w200/$profilePath',
                        width: 150.w,
                        height: 150.w,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(height: 12.h),
              Text(
                username,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 8.h),
              ProfileItem(
                iconPath: 'profile',
                title: 'Edit Profile',
                route: AppRoute.editProfile,
              ),
              ProfileItem(
                iconPath: 'notification',
                title: 'Notification',
              ),
              ProfileItem(
                iconPath: 'security',
                title: 'Security',
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return ProfileItem(
                    iconPath: 'language',
                    title: 'Language',
                    route: AppRoute.languages,
                    trailingText:
                        state.currentLanguage == 'en' ? 'English' : "Русский",
                  );
                },
              ),
              SizedBox(height: 20.h),
              changeTheme(context),
              ProfileItem(
                iconPath: 'help',
                title: 'Help Center',
              ),
              ProfileItem(
                iconPath: 'privacy',
                title: 'Privacy Policy',
              ),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget changeTheme(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/curved/show.svg',
              color: Theme.of(context).iconTheme.color,
            ),
            SizedBox(width: 20.w),
            SemiBoldText18(
              'Dark Mode'.tr(),
            ),
          ],
        ),
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Switch(
              activeColor: AppColors.primary,
              value: !state.isLight,
              onChanged: ((value) {
                context.read<SettingsCubit>().changeTheme();
                HiveService.saveTheme(!state.isLight).then((value) {
                  return value;
                });
              }),
            );
          },
        )
      ],
    );
  }
}
