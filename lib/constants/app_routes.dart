import 'package:flutter/cupertino.dart';

import 'package:mova_app/ui/pages/auth/sign_in_page.dart';

import 'package:mova_app/ui/pages/tabs/profile/edit_profile.dart';
import 'package:mova_app/ui/pages/tabs/profile/profile_page.dart';
import 'package:mova_app/ui/pages/splash/splash_page.dart';

import '../ui/pages/tabs/explore/explore_page.dart';
import '../ui/pages/tabs/profile/languages_page.dart';
import '../ui/pages/visit/visit_page.dart';
import '../ui/pages/tab_selector/tab_selector.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String visit = '/visit';
  static const String signIn = '/signIn';
  static const String letsIn = '/letsIn';
  static const String interests = '/interests';
  static const String tabSelector = '/tabSelector';
  static const String topMovies = '/topMovies';
  static const String explore = '/search';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String languages = '/language';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashPage(),
    visit: (context) => VisitPage(),
    signIn: (context) => const SignInPage(),
    tabSelector: (context) => const TabSelector(),
    explore: (context) => const ExplorePage(),
    profile: (context) => const ProfilePage(),
    editProfile: (context) => const EditProfilePage(),
    languages: (context) => const LanguagesPage(),
  };
}
