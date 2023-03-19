import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:mova_app/ui/widgets/buttons/back_button.dart';
import 'package:mova_app/ui/widgets/forms/input_form.dart';

import '../../../../services/hive_service.dart';
import '../../../../utils/theme_brightnes.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerNickName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  String? selectedValue;
  String? profilePath;
  @override
  void initState() {
    final userInfo = HiveService.getAccountDetails().entries.toList();

    profilePath = userInfo[2].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ArrowBackButton(),
                        Text(
                          'EditProfile'.tr(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
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
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/images/edit_square.png'),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                InputForm(
                  hintText: 'Full Name',
                  controller: controllerFullName,
                ),
                SizedBox(height: 24.h),
                InputForm(
                  hintText: 'Nickname',
                  controller: controllerNickName,
                ),
                SizedBox(height: 24.h),
                InputForm(
                    hintText: 'Email',
                    controller: controllerEmail,
                    suffixIcon: 'curved/message'),
                SizedBox(height: 24.h),
                IntlPhoneField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        height: 56.h,
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: DropdownButton(
                          underline: const SizedBox(height: 0),
                          borderRadius: BorderRadius.circular(20),
                          hint: const Text(
                            'Gender',
                            style: TextStyle(
                              color: AppColors.greyScale500,
                            ),
                          ),
                          isExpanded: true,
                          value: selectedValue,
                          onChanged: ((String? value) {
                            selectedValue = value;
                            setState(() {});
                          }),
                          items: const [
                            DropdownMenuItem(
                              value: 'Male',
                              child: Text('Male'),
                            ),
                            DropdownMenuItem(
                              value: 'Female',
                              child: Text('Female'),
                            ),
                          ],
                        ),
                      ),
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
}
