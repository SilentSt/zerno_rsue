import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:zerno_rsue/cubit/registration_cubit/cubit.dart';
import 'package:zerno_rsue/data/local/app_controllers.dart';
import 'package:zerno_rsue/data/models/user.dart';
import 'package:zerno_rsue/data/remote/api.dart';
import 'package:zerno_rsue/resources/app_errors.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationLoadedState());

  Future<void> createUser() async {
    emit(RegistrationLoadingState());
    if (AppControllers.regEmailController.text.isEmpty ||
        AppControllers.regPasswordController.text.isEmpty ||
        AppControllers.regCodeController.text.isEmpty) {
      emit(RegistrationErrorState(AppErrors.emptyFields));
    } else {
      var user = RegistrationUser(
        email: AppControllers.regEmailController.text,
        password: AppControllers.regPasswordController.text,
        name: AppControllers.regCodeController.text,
        code: AppControllers.regCodeController.text,
      );
      var mappedUser = user.toJson;
      var jsonUser = json.encode(mappedUser);
      var res = await API.createUser(jsonUser);
      if (res.statusCode > 299) {
        emit(RegistrationErrorState(AppErrors.wrongData));
      } else {
        emit(RegistrationSuccessState());
      }
    }
  }
}
