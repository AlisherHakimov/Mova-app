import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/ui/pages/tabs/explore/explore_page.dart';
import 'package:mova_app/ui/pages/tabs/home/home_page.dart';
import 'package:mova_app/ui/pages/tabs/my_list/my_list_page.dart';

import '../tabs/profile/profile_page.dart';

class TabSelector extends StatefulWidget {
  const TabSelector({super.key});

  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;
  String label1 = 'Home';
  String label2 = 'Explore';
  String label3 = 'My List';
  String label4 = 'Download';
  String label5 = 'Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.dark2.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: AppColors.primary,
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          items: [
            BottomNavigationBarItem(
              activeIcon: tabIcon(label1, true),
              label: label1.tr(),
              icon: tabIcon(label1, false),
            ),
            BottomNavigationBarItem(
              activeIcon: tabIcon(label2, true),
              label: label2.tr(),
              icon: tabIcon(label2, false),
            ),
            BottomNavigationBarItem(
              activeIcon: tabIcon(label3, true),
              label: label3.tr(),
              icon: tabIcon(label3, false),
            ),
            BottomNavigationBarItem(
              activeIcon: tabIcon(label5, true),
              label: label5.tr(),
              icon: tabIcon(label5, false),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomePage(),
          ExplorePage(),
          MyListPage(),
          ProfilePage(),
        ],
      ),
    );
  }

  Widget tabIcon(String label, bool isActive) {
    return SvgPicture.asset(
      'assets/icons/${isActive ? 'bold' : 'light_border'}/${label.toLowerCase()}.svg',
      color: isActive ? AppColors.primary : AppColors.greyScale500,
    );
  }
}
