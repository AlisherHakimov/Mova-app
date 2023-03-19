import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_colors.dart';

// ignore: must_be_immutable
class InputForm extends StatefulWidget {
  InputForm({
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.controller,
    this.onChanged,
    super.key,
  });

  TextEditingController controller = TextEditingController();
  String hintText;
  String? prefixIcon;
  String? suffixIcon;
  Function(String)? onChanged;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool _passwordVisible = false;
  @override
  void initState() {
    super.initState();
  }

  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (bool isFocused) {
        setState(() {
          enabled = isFocused;
        });
      },
      child: TextFormField(
        onChanged: widget.onChanged,
        // enabled: enabled,
        keyboardType: widget.hintText == 'Email'
            ? TextInputType.emailAddress
            : TextInputType.streetAddress,

        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.4,
        ),
        obscureText: widget.hintText == 'Password' && !_passwordVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.4,
          ),
          prefixIcon: widget.prefixIcon != null
              ? SvgPicture.asset(
                  'assets/icons/${widget.prefixIcon}.svg',
                  // cacheColorFilter: true,
                  color: enabled == true
                      ? AppColors.primary
                      : AppColors.greyScale500,
                  fit: BoxFit.none,
                )
              : null,
          suffixIcon: widget.hintText == 'Password'
              ? IconButton(
                  splashRadius: 3,
                  onPressed: () {
                    _passwordVisible = !_passwordVisible;
                    setState(() {});
                  },
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : (widget.suffixIcon == null
                  ? null
                  : SvgPicture.asset(
                      'assets/icons/${widget.suffixIcon}.svg',
                      color: enabled == true
                          ? AppColors.primary
                          : AppColors.greyScale500,
                      fit: BoxFit.none,
                    )),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintText: widget.hintText.tr(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
