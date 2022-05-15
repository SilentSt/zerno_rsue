import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zerno_rsue/cubit/login_cubit/cubit.dart';
import 'package:zerno_rsue/cubit/navigation_cubit/cubit.dart';
import 'package:zerno_rsue/data/local/app_controllers.dart';
import 'package:zerno_rsue/resources/app_colors.dart';
import 'package:zerno_rsue/resources/app_strings.dart';
import 'package:zerno_rsue/ui/widgets/app_error.dart';
import 'package:zerno_rsue/ui/widgets/buttons/hovered_widget.dart';
import 'package:zerno_rsue/ui/widgets/text_fields/app_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<LoginCubit>();
    var _navCubit = context.read<NavigationCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoginLoadedState) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: SizedBox(
                  height: 250,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextField(
                        controller: AppControllers.loginEmailController,
                        label: AppStrings.emailField,
                      ),
                      AppTextField(
                        controller: AppControllers.loginPasswordController,
                        label: AppStrings.passwordField,
                        obscuredField: true,
                        obscureWidgetActive: const Icon(Icons.visibility),
                        obscureWidgetDisabled: const Icon(
                          Icons.visibility_off,
                        ),
                      ),
                      CupertinoButton(
                        child: const Text(AppStrings.loginButton),
                        onPressed: _cubit.login,
                        color: AppColors.lightGrey,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      HoveredWidget(
                        builder: (context, isHovered) => GestureDetector(
                          onTap: _navCubit.pushRegistrationScreen,
                          child: const SizedBox(
                            height: 30,
                            width: 300,
                            child: Center(
                              child: Text(
                                AppStrings.regButton,
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
        if (state is LoginSuccessState) {
          _navCubit.pushHomeScreen();
          _cubit.dropState();
        }
        if (state is LoginErrorState) {
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
