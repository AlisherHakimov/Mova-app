import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mova_app/bloc/home/home_cubit.dart';
import 'package:mova_app/firebase_options.dart';
import 'package:mova_app/utils/restart_wdget.dart';
import 'package:mova_app/utils/theme_data_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mova_app/services/hive_service.dart';
import 'package:provider/provider.dart';
import 'bloc/details/details_cubit.dart';
import 'bloc/explore/explore_cubit.dart';
import 'bloc/my_list/my_list_cubit.dart';
import 'bloc/settings/settings_cubit.dart';
import 'bloc/settings/settings_state.dart';
import 'bloc/sign_in/signin_cubit.dart';
import 'constants/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await HiveService.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        // Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (BuildContext context) => HomeCubit(),
          ),
          BlocProvider<DetailsCubit>(
            create: (BuildContext context) => DetailsCubit(),
          ),
          BlocProvider<SettingsCubit>(
            create: (BuildContext context) => SettingsCubit()
              ..changeLanguage(HiveService.getLanguage())
              ..getTheme(HiveService.getTheme()),
          ),
          BlocProvider<ExploreCubit>(
            create: (BuildContext context) => ExploreCubit(),
          ),
          BlocProvider<MyListCubit>(
            create: (BuildContext context) => MyListCubit(),
          ),
          BlocProvider<SignInCubit>(
            create: (BuildContext context) => SignInCubit(),
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return RestartWidget(
              child: MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoute.splash,
                routes: AppRoute.routes,
                theme: state.isLight
                    ? ThemeProvider.lightTheme
                    : ThemeProvider.darkTheme,
              ),
            );
          },
        ),
      ),
      designSize: const Size(438, 926),
    );
  }
}
