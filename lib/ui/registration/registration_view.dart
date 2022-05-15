import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
import 'package:zerno_rsue/cubit/registration_cubit/cubit.dart';
import 'package:zerno_rsue/data/local/app_controllers.dart';
import 'package:zerno_rsue/resources/app_colors.dart';
import 'package:zerno_rsue/resources/app_strings.dart';
import 'package:zerno_rsue/ui/widgets/app_error.dart';
import 'package:zerno_rsue/ui/widgets/buttons/hovered_widget.dart';
import 'package:zerno_rsue/ui/widgets/text_fields/app_textfield.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<RegistrationCubit>();
    var _navCubit = context.read<NavigationCubit>();
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        if (state is RegistrationLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RegistrationLoadedState) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SizedBox(
                  height: 350,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextField(
                        controller: AppControllers.regEmailController,
                        label: AppStrings.emailField,
                      ),
                      AppTextField(
                        controller: AppControllers.regCodeController,
                        label: AppStrings.codeField,
                      ),
                      AppTextField(
                        controller: AppControllers.regPasswordController,
                        label: AppStrings.passwordField,
                        obscuredField: true,
                        obscureWidgetActive: const Icon(Icons.visibility),
                        obscureWidgetDisabled: const Icon(
                          Icons.visibility_off,
                        ),
                      ),
                      CupertinoButton(
                        child: const Text(AppStrings.regButton),
                        onPressed: _cubit.createUser,
                        color: AppColors.lightGrey,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      HoveredWidget(
                        builder: (context, isHovered) => GestureDetector(
                          onTap: _navCubit.pushLoginScreen,
                          child: const SizedBox(
                            height: 30,
                            width: 300,
                            child: Center(
                              child: Text(
                                AppStrings.alreadyReg,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (state is RegistrationSuccessState) {
          _cubit.dropState();
          _navCubit.pushLoginScreen();
        }
        if (state is RegistrationErrorState) {
          return AppError(
            acceptAction: _cubit.dropState,
            text: state.error,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
