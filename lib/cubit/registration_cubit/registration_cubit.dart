import 'package:bloc/bloc.dart';
import 'package:zerno_rsue/cubit/registration_cubit/cubit.dart';

class RegistrationCubit extends Cubit<RegistrationState>{
  RegistrationCubit() : super(RegistrationLoadedState());

}