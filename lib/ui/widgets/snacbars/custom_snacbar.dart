import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

SnackBar customSnacBar(BuildContext context,
    {required String message,
    required title,
    required ContentType contentType}) {
  return SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
    ),
    duration: const Duration(seconds: 3),
  );
}
