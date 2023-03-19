import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/ui/widgets/buttons/back_button.dart';
import '../../../../bloc/settings/settings_cubit.dart';
import '../../../../bloc/settings/settings_state.dart';
import '../../../../utils/restart_wdget.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              ArrowBackButton(),
              SizedBox(width: 12.w),
              Text(
                'Language'.tr(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          languageTile(context, 'English', 'en'),
          languageTile(context, 'Русский', "ru"),
        ],
      ),
    );
  }

  ListTile languageTile(BuildContext context, String title, String language) {
    return ListTile(
      textColor: Theme.of(context).iconTheme.color,
      title: Text(title),
      trailing: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Radio(
            fillColor: MaterialStateProperty.all(AppColors.primary),
            groupValue: context.locale.languageCode,
            value: language,
            onChanged: (String? language) {
              context.read<SettingsCubit>().changeLanguage(language);

              Locale locale = Locale(state.currentLanguage);
              switch (language) {
                case 'en':
                  locale = const Locale('en', 'US');
                  break;
                case 'ru':
                  locale = const Locale('ru', 'RU');
                  break;
              }
              context.setLocale(locale);

              RestartWidget.restartApp(context);
            },
          );
        },
      ),
    );
  }
}
