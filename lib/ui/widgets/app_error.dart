import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zerno_rsue/resources/app_errors.dart';

class AppError extends StatelessWidget {
  const AppError({
    Key? key,
    required this.acceptAction,
    required this.text,
  }) : super(key: key);

  final VoidCallback acceptAction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        AppErrors.errorTitle,
      ),
      content: Text(text),
      actions: [
        CupertinoButton(
          child: const Text(AppErrors.acceptError),
          onPressed: acceptAction,
        ),
      ],
    );
  }
}
