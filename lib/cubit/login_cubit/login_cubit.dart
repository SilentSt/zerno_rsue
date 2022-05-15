import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:zerno_rsue/data/local/app_controllers.dart';
import 'package:zerno_rsue/data/local/temp_storage.dart';
import 'package:zerno_rsue/data/models/user.dart';
import 'package:zerno_rsue/data/remote/api.dart';
import 'package:zerno_rsue/resources/app_errors.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginLoadedState());

  Future<void> login() async {
    emit(LoginLoadingState());
    if (AppControllers.loginEmailController.text.isEmpty ||
        AppControllers.loginPasswordController.text.isEmpty) {
      emit(LoginErrorState(AppErrors.emptyFields));
    } else {
      var user = LoginUser(
        email: AppControllers.loginEmailController.text,
        password: AppControllers.loginPasswordController.text,
      );
      AppControllers.loginEmailController.clear();
      AppControllers.loginPasswordController.clear();
      var mappedUser = user.toJson;
      var jsonUser = json.encode(mappedUser);
      var res = await API.login(jsonUser);
      if(res.statusCode>299){
        emit(LoginErrorState(AppErrors.wrongAuthData));
      }
      else{
        Map<String, dynamic> data = json.decode(res.body);
        TempStorage.token = data['token'];
        emit(LoginSuccessState());
      }
    }
  }

  Future<void> dropState() async => emit(LoginLoadedState());
}
