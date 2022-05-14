import 'package:bloc/bloc.dart';
import 'package:zerno_rsue/cubit/home_cubit/cubit.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeLoadedState());

}