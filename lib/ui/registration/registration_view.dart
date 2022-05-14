import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/registration_cubit/cubit.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return const SizedBox.shrink();
      },
    );
  }
}
